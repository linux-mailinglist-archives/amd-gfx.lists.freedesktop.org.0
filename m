Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D595A1CE54D
	for <lists+amd-gfx@lfdr.de>; Mon, 11 May 2020 22:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2A66E56D;
	Mon, 11 May 2020 20:22:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 484 seconds by postgrey-1.36 at gabe;
 Mon, 11 May 2020 20:22:49 UTC
Received: from torfep04.bell.net (simcoe209srvr.owm.bell.net [184.150.200.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537006E56D;
 Mon, 11 May 2020 20:22:49 +0000 (UTC)
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
 with ESMTP
 id <20200511201443.FSAV30085.torfep02.bell.net@torspm01.bell.net>;
 Mon, 11 May 2020 16:14:43 -0400
Received: from [192.168.1.208] (really [70.49.140.223])
 by torspm01.bell.net with ESMTP
 id <20200511201442.CKYX29322.torspm01.bell.net@[192.168.1.208]>;
 Mon, 11 May 2020 16:14:42 -0400
Date: Mon, 11 May 2020 16:14:40 -0400
From: Al Dunsmuir <al.dunsmuir@sympatico.ca>
Message-ID: <1815605280.20200511161440@sympatico.ca>
To: =?windows-1250?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
In-Reply-To: <20200511171722.96576-1-christian.koenig@amd.com>
References: <20200511171722.96576-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-CM-Analysis: v=2.3 cv=KfusTjQD c=1 sm=1 tr=0 a=nyNe8J8XL+yB5u22Hc0alw==:117
 a=nyNe8J8XL+yB5u22Hc0alw==:17 a=E5nwcu9QDW8A:10 a=sTwFKg_x9MkA:10
 a=DziIhFR-Z5z0ICe3fxgA:9 a=JGxRANio5w40qwYj:21 a=ohBUF8MfRNpXJLC_:21
 a=udTvpura_4gA:10
X-CM-Envelope: MS4wfDQf9RWIz/QqDHli9RW6oH76wLhgYeWwG1+ErTNbuScjmeeLlZp3qRD8eUt2V5KU4Ah85rBWBIojybqgP/DicxAtXYeE7GJPUWHL13x6E0ufPyU4xgL1
 Wneuh+5prvcTenjiM/1PzBg5+/y6UHR5F75YFTizYGX/z8bDZ9ymPsD96n/NiJoXih8+QmY4A6X9sMuOoQ+IrPFGlhddFP43n3fNlDJPjELkJvUPpFIZLGql
 LV0KxwWj+qcdGGT9Xd3Ph54IERwyWKx8EklJ/MxWiRsW15Af6jVOjwt2KeERaJDG
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="cp1250"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uZGF5LCBNYXkgMTEsIDIwMjAsIDE6MTc6MTkgUE0sICJDaHJpc3RpYW4gS/ZuaWciIHdy
b3RlOgo+IEhpIGd1eXMsCgo+IFdlbGwgbGV0J3MgZmFjZSBpdCBBR1AgaXMgYSB0b3RhbCBoZWFk
YWNoZSB0byBtYWludGFpbiBhbmQgZGVhZCBmb3IgYXQgbGVhc3QgMTArIHllYXJzLgoKPiBXZSBo
YXZlIGEgbG90IG9mIHg4NiBzcGVjaWZpYyBzdHVmZiBpbiB0aGUgYXJjaGl0ZWN0dXJlIGluZGVw
ZW5kZW50Cj4gZ3JhcGhpY3MgbWVtb3J5IG1hbmFnZW1lbnQgdG8gZ2V0IHRoZSBjYWNoaW5nIHJp
Z2h0LCBhYnVzaW5nIHRoZSBETUEKPiBBUEkgb24gbXVsdGlwbGUgb2NjYXNpb25zLCBuZWVkIHRv
IGRpc3RpbmN0IGJldHdlZW4gQUdQIGFuZCBkcml2ZXIgc3BlY2lmaWMgcGFnZSB0YWJsZXMgZXRj
IGV0Yy4uLgoKPiBTbyB0aGUgaWRlYSBoZXJlIGlzIHRvIGp1c3QgZ28gYWhlYWQgYW5kIHJlbW92
ZSB0aGUgc3VwcG9ydCBmcm9tCj4gUmFkZW9uIGFuZCBOb3V2ZWF1IGFuZCB0aGVuIGRyb3AgdGhl
IG5lY2Vzc2FyeSBjb2RlIGZyb20gVFRNLgoKPiBGb3IgUmFkZW9uIHRoaXMgbWVhbnMgdGhhdCB3
ZSBqdXN0IHN3aXRjaCBvdmVyIHRvIHRoZSBkcml2ZXIKPiBzcGVjaWZpYyBwYWdlIHRhYmxlcyBh
bmQgZXZlcnl0aGluZyBzaG91bGQgbW9yZSBvciBsZXNzIGNvbnRpbnVlIHRvIHdvcmsuCgo+IEZv
ciBOb3V2ZWF1IEknbSBub3QgMTAwJSBzdXJlLCBidXQgZnJvbSB0aGUgY29kZSBpdCBvZiBoYW5k
IGxvb2tzCj4gbGlrZSB3ZSBjYW4gZG8gaXQgc2ltaWxhciB0byBSYWRlb24uCgo+IFBsZWFzZSBj
b21tZW50IHdoYXQgeW91IHRoaW5rIGFib3V0IHRoaXMuCgo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFu
LgoKQ2hyaXN0aWFuLAoKSSB3b3VsZCByZXNwZWN0ZnVsbHkgYXNrIHRoYXQgdGhpcyBjaGFuZ2Ug
YmUgcmVqZWN0ZWQuCgpJJ20gIGN1cnJlbnRseSAgYW4gIGVuZCB1c2VyIG9uIGJvdGggSW50ZWwg
KDMyLWJpdCBhbmQgNjQtYml0KSBhbmQgUFBDCihNYWNzLCBJQk0gUG93ZXIgLSBCRSBhbmQgTEUp
LgoKTGludXggaXMgbm90IGp1c3QgdXNlZCBmb3IgbW9kZXJuIGhhcmR3YXJlLiBUaGVyZSBpcyBh
bHNvIGEgc3Vic2V0IG9mCnRoZSB1c2VyIGJhc2UgdGhhdCB1c2VzIGl0IGZvciB3aGF0IGlzIG9m
dGVuIHRlcm1lZCByZXRyby1jb21wdXRpbmcuCk5vIGl0J3Mgbm90IGNvbW1lcmNpYWwgdXNhZ2Us
IGJ1dCBubyBvbmUgY2FuIHNlcmlvdXNseSBjbGFpbSB0aGF0IHRoYXQKTGludXggaXMgZm9yIGJ1
c2luZXNzIG9ubHkuCgpPZnRlbiB0aGUgb2xkIGhhcmR3YXJlIGlzIGJ1aWx0IGZhciBiYXR0ZXIg
dGhhbiB0aGUgbW9kZXJuIGp1bmssIGFuZAp3aWxsIGNvbnRpbnVlIHRvIHJ1biBmb3IgeWVhcnMg
dG8gY29tZS4gVGhpcyBncm91cCBvZiBmb2xrcyBlaXRoZXIgaGFzCmV4aXN0aW5nIGhhcmR3YXJl
IHRoZXkgd2lzaCB0byBjb250aW51ZSB0byB1c2UsIG9yIGFyZSBhY3F1aXJpbmcgdGhlCnNhbWUg
YmVjYXVzZSB0aGV5IGFyZSB0aXJlZCBvZiBnZW5lcmljIGxvY2tlZC1kb3duIGhhcmR3YXJlLgoK
QSBzaWduaWZpY2FudCBwZXJjZW50YWdlIG9mIHRoZSB2aWRlbyBoYXJkd2FyZSB0aGF0IGZhbGxz
IGluIHRoZSByZXRybwpjYXRlZ29yeSB1c2VzIHRoZSBBR1AgdmlkZW8gYnVzLiBSZW1vdmluZyB0
aGF0IHN1cHBvcnQgZm9yIHRob3NlIGNhc2VzCndoZXJlIGl0IHdvcmtzIHdvdWxkIHNldmVyZWx5
IGxpbWl0IHBlcmZvcm1hbmNlIGFuZCBpbiBzb21lIGNhc2VzCmZ1bmN0aW9uYWxpdHkuIFRoaXMg
Y2FuIG1lYW4gdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBiZWluZyBhYmxlIHRvIHJ1bgphbiBhcHBs
aWNhdGlvbiwgb3IgaGF2aW5nIGl0IGZhaWwuCgpUaGVyZSBhcmUgbXVsdGlwbGUgYWN0aXZlIExp
bnV4IGRpc3RyaWJ1dGlvbnMgZm9yIFBQQyBNYWNzLiBNYW55IGZvbGtzCmFyZSBtb3ZpbmcgZnJv
bSBydW5uaW5nIGFuIG9yaWdpbmFsIE1hYyBPUyBYIGJlY2F1c2Ugb2YgdGhlIHJlY2VudAptaWdy
YXRpb24gb2YgbW9zdCBXZWIgc2VydmljZXMgdG8gbmV3IGVuY3J5cHRpb24gcHJvdG9jb2xzIChU
TFMgMS4yLApTU0wsIGV0Yy4pIHdoaWNoIGNhbiBub3QgYmUgcHJhY3RpY2FsbHkgc3VwcG9ydGVk
IGJ5IGJyb3dzZXJzIG9uIHRoYXQKT1MgLSBldmVuIHRoZSBvcGVuIHNvdXJjZSBvbmVzLiBMaW51
eCBvbiB0aGF0IHNhbWUgaGFyZHdhcmUgcHJvdmlkZXMKdGhlIG9wcG9ydHVuaXR5IHRvIHdvcmsg
b25saW5lIHdpdGggY3VycmVudCBwcm90b2NvbHMgYW5kIGVuc3VyZSB0aGF0CnRoZXkgYXJlIHJl
YXNvbmFibHkgc2VjdXJlLgoKQW5vdGhlciBncm91cCB0aGF0IGZpdHMgaW4gdGhlIHJldHJvIGNh
dGVnb3J5IGlzIHRob3NlIGZvbGtzIHdpdGgKb2xkZXIgUEMgaGFyZHdhcmUgd2hvIGFyZSBub3Qg
bWlncmF0aW5nIHRvIHRoZSBsYXRlc3QgTWljcm9zb2Z0IE9TLApidXQgaW5zdGVhZCB3YW50IHRv
IG1vdmUgdG8gTGludXguCgpTb21lIGZvbGtzIHN1Z2dlc3QgdGhlIHJldHJvIGZvbGtzIHVzZSBh
biBvbGRlciB1bm1haW50YWluZWQgTGludXgKdmVyc2lvbi4gVGhhdCdzIGp1c3Qgbm90IGFwcHJv
cHJpYXRlIG5vciByZWFzb25hYmxlLCBhZ2FpbiBmcm9tIGVpdGhlcgphIHNlY3VyaXR5IGFuZCBw
cm90b2NvbCBwb2ludCBvZiB2aWV3LgoKTXlzZWxmPyBJJ20gYSBmdWxsLXRpbWUgQyBwcm9ncmFt
bWVyIGFuZCBFbGVjdHJpY2FsIEVuZ2luZWVyLiBNeQpjdXJyZW50IHdvcmsgcHJvamVjdCBpcyBh
Ym91dCA0MDBLTE9DLiBJJ3ZlIGRvbmUgc29tZSB3b3JrIG9uIFBDIGFuZAplbWJlZGRlZCB2aWRl
byBoYXJkd2FyZSBhbmQgc29mdHdhcmUgaW4gdGhlIHBhc3QuCgpNeSBhaW0gaXMgdG8gc3RhcnQg
b3V0IGJ5IGhlbHBpbmcgdG8gdGVzdCB0aGUgdmlkZW8gZHJpdmVycyAob24gYm90aApQQyBhbmQg
TUFDIGhhcmR3YXJlKSwgYW5kIGFzIEkgZ2FpbiBtb3JlIGtub3dsZWRnZSBiZWNvbWUgcGFydCBv
ZiB0aGUKZWZmb3J0IHRvIGJyaW5nIHRoZSBkcml2ZXJzIHRvIHRoZSBvbGRlciBoYXJkd2FyZSBp
bnRvIGEgYmV0dGVyIGZvcm0KKGluIGtlcm5lbCBkcml2ZXJzIFZTIHVzZXItc3BhY2UpLgoKT3Zl
ciB0aGUgbGFzdCBmZXcgeWVhcnMgSSBoYXZlIGJlZW4gY29sbGVjdGluZyBhIHNpZ25pZmljYW50
ICh+NDApCm51bWJlciBvZiB2aWRlbyBjYXJkcyBvZiB2YXJpb3VzIGZsYXZvcnMuIFNvbWUgUENJ
LCBidXQgdGhlIG1ham9yaXR5CmV2ZW5seSBkaXZpZGVkIGJldHdlZW4gQUdQIGFuZCBQQ0ktWC4g
TW9zdCBhcmUgQVRJL1JhZGVvbiAoTWFjaDY0Kwp0aHJvdWdoIFI3KSB3aXRoIHNvbWUgTnZpZGlh
LCBNYXRyb3ggYW5kIGEgZmV3IG90aGVycyAoQ2hyb21lIGFuZCBldmVuCmEgTnVtYmVyIE5pbmUp
LiBJIHRyeSB0byBoYXZlIGJvdGggUEMgYW5kIE1hYyB2YXJpYW50cyBvZiB0aGUgc2FtZQpjYXJk
IHdoZXJlLWV2ZXIgcG9zc2libGUgdG8gbWFrZSBjb21wYXJpc29ucyBhY3Jvc3MgYXJjaGl0ZWN0
dXJlcwplYXNpZXIuIFRoaXMgeWVhciBJIGhhdmUgYWNxdWlyZWQgc29tZSBvZiB0aGUgbGFzdCBT
YXBwaGlyZSBSYWRlb24gQUdQCmNhcmRzIChIRDN4eHgsIEhENHh4eCkuIEknbSBhIGZyZXF1ZW50
IGZseWVyIG9uIGVCYXkgYW5kIEtpamlqaS4KCkkndmUgZ290IGxvdHMgb2YgTWFjcyAoUENJLCBB
R1AgYW5kIFBDSS1YKSBhbmQgYSBudW1iZXIgb2YgZnVsbCBQQwpzeXN0ZW1zLiBJJ20gc2V0dGlu
ZyB1cCBhIG51bWJlciBvZiBkZWRpY2F0ZWQgdGVzdCBiZW5jaCByaWdzIChhbmQKZnVsbCBzeXN0
ZW1zKSBzcGVjaWZpY2FsbHkgZm9yIHRoZSB2aWRlbyB0ZXN0aW5nLiBNb3N0IGFyZSBBTUQgNjQt
Yml0CmNhcGFibGUsIGJ1dCBhbHNvIEludGVsLiBGaW5hbGx5LCB0aGVyZSBhcmUgYSBmZXcgZW1i
ZWRkZWQgc3lzdGVtcwooQU1EIGFuZCBhIEMzKS4KCkZyb20gdGhlIHByb2dyYW1taW5nIHNpZGUs
IEFtYXpvbiBoYXMgYmVlbiBhIGdvb2Qgc291cmNlIG9uIG9sZGVyCmVkaXRpb25zIG9mIGNvbXB1
dGVyIGdyYXBoaWNzIGJvb2tzLCB3aGljaCBzaG91bGQgcHJvdmlkZSBiYWNrZ3JvdW5kCmtub3ds
ZWRnZSB0byBoZWxwIG1lIGluIG15IGpvdXJuZXkuCgpPbmUgZ2xpdGNoIGlzIHRoYXQgSSdtIHBh
cnR3YXkgdGhyb3VnaCBleWUgc3VyZ2VyeSAoY29ybmVhICsgY2F0YXJhY3RzKSwKYW5kIG15IGZp
bmFsIG9wZXJhdGlvbiBpcyBoZWxkIHVwIGR1ZSB0byBDT1ZJRC0xOS4gIEFmdGVyIHRoaW5ncyBn
ZXQKYmFjayB0byBtb3JlIG9mIGEgbm9ybWFsIHN0YXRlIGFuZCB0aGF0IGNhbiBiZSBjb21wbGV0
ZWQsIG15IHByb2dyZXNzCnNob3VsZCBiZSBhIGxvdCBzbW9vdGhlci4KCkkgaG9wZSB0aGlzIHB1
dHMgYW5vdGhlciBwcm9zcGVjdGl2ZSBvbiB5b3VyIHN1Z2dlc3RlZCBjaGFuZ2UsIGZyb20gYQpM
aW51eCBlbnRodXNpYXN0IGFuZCBwcm9ncmFtbWVyIHdob3NlIHVzYWdlIHNldCBpcyBmYXIgZGlm
ZmVyZW50IGZyb20KeW91ciBvd24uIEZvciB0aGF0IGdyb3VwIG9mIExpbnV4IHVzZXJzLCBJIGFz
ayB0aGF0IHlvdSBOT1QgZ28gYWhlYWQKd2l0aCB0aGlzIGNoYW5nZSBhcyBpdCB3b3VsZCBiZSBm
YXIgbW9yZSBpbXBhY3RmdWwgdG8gdGhhdCBncm91cHMgdGhhbgp5b3UgbWlnaHQgdGhpbmsuCgpS
ZXNwZWN0ZnVsbHksCkFsIER1bnNtdWlyCgpBbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4Cg==
