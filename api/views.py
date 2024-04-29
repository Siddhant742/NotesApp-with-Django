from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Note
from .serializers import NoteSerializer



# Create your views here.

def getRoutes(request):
    routes = [
        {
            'Endpoint': '/notes/',
            'Method': 'GET',
            'Body': None,
            'Description': 'Returns an array of notes'
        },
        {
            'Endpoint': '/notes/id',
            'Method': 'GET',
            'Body': None,
            'Description': 'Returns a single note object'
        },
        {
            'Endpoint': '/notes/create/',
            'Method': 'POST',
            'Body': {'body': ""},
            'Description': 'Creates a new note with data sent in post request'
        },
        {
            'Endpoint': '/notes/id/update/',
            'Method': 'PUT',
            'Body': {'body': ""},
            'Description': 'Updates a note with data sent in post request'
        },
        {
            'Endpoint': '/notes/id/delete/',
            'Method': 'DELETE',
            'Body': None,
            'Description': 'Deletes a note'
        },
    ]
    return Response(routes)

@api_view(['GET'])
def getNotes(request):
    notes = Note.objects.all()
    serializer = NoteSerializer(notes, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def getNote(request, pk):
    note = Note.objects.get(id = pk)
    serializer = NoteSerializer(note, many=False)
    return Response(serializer.data)

@api_view(['POST'])
def createNote(request):
    note = Note.objects.create(body=request.data['body'])
    serializer = NoteSerializer(note, many=False)
    return Response(serializer.data)

@api_view(['PUT'])
def updateNote(request, pk):
    data = request.data
    note = Note.objects.get(id = pk)
    serializer = NoteSerializer(note, many=False)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)

@api_view(['DELETE'])
def deleteNote(request, pk):
    note = Note.objects.get(id = pk)
    note.delete()
    return Response('Successfully deleted the note')