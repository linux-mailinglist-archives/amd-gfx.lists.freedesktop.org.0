Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF44B584A
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 00:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883016EA5C;
	Tue, 17 Sep 2019 22:56:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-72.mimecast.com
 (us-smtp-delivery-72.mimecast.com [63.128.21.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1D66EA5C
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 22:56:29 +0000 (UTC)
Received: from smtp01.valvesoftware.com (smtp01.valvesoftware.com
 [208.64.203.181]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-azHu69OZPT2L3iCgiNWVhQ-1; Tue, 17 Sep 2019 18:56:26 -0400
Received: from [172.16.1.107] (helo=antispam.valve.org)
 by smtp01.valvesoftware.com with esmtp (Exim 4.86_2)
 (envelope-from <pgriffais@valvesoftware.com>) id 1iAMOX-000AWq-Nv
 for amd-gfx@lists.freedesktop.org; Tue, 17 Sep 2019 15:56:25 -0700
Received: from antispam.valve.org (127.0.0.1) id hg5i9i0171sm for
 <amd-gfx@lists.freedesktop.org>;
 Tue, 17 Sep 2019 15:56:25 -0700 (envelope-from <pgriffais@valvesoftware.com>)
Received: from mail1.valvemail.org ([172.16.144.22])
 by antispam.valve.org ([172.16.1.107]) (SonicWALL 9.0.5.2081 )
 with ESMTP id o201909172256250015955-5; Tue, 17 Sep 2019 15:56:25 -0700
Received: from [172.18.21.27] (172.18.21.27) by mail1.valvemail.org
 (172.16.144.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1415.2; Tue, 17 Sep
 2019 15:55:31 -0700
Subject: Re: [PATCH] drm/amd/display: Create plane rotation property
To: <amd-gfx@lists.freedesktop.org>
References: <20190912164404.12725-1-pgriffais@valvesoftware.com>
 <b781b06d-a52f-0291-b0df-d90b81a66c84@amd.com>
 <907ff2ce-e273-1ea0-a17b-522745756164@amd.com>
 <9cc53c0f-db53-96a1-32de-a2303c3b62d9@valvesoftware.com>
From: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
Message-ID: <d3d4c53c-0ff3-2833-54a1-bcb7a9ac58b3@valvesoftware.com>
Date: Tue, 17 Sep 2019 15:53:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <9cc53c0f-db53-96a1-32de-a2303c3b62d9@valvesoftware.com>
Content-Language: en-US
X-ClientProxiedBy: mail1.valvemail.org (172.16.144.22) To mail1.valvemail.org
 (172.16.144.22)
X-EXCLAIMER-MD-CONFIG: fe5cb8ea-1338-4c54-81e0-ad323678e037
X-Mlf-CnxnMgmt-Allow: 172.16.144.22
X-Mlf-Version: 9.0.5.2081
X-Mlf-License: BSVKCAP__
X-Mlf-UniqueId: o201909172256250015955
X-MC-Unique: azHu69OZPT2L3iCgiNWVhQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=valvesoftware.com; 
 s=mc20150811; t=1568760988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VzZQl7j75jIuyQ1vDfgJ0AhddI2fKbeskrigyumaGSY=;
 b=iOCG1OTtajNiiPGIKx4SEsDEtWICVsSFDVIr2eFUCReT7jFt+nssCOO8Kf0nhM5jWVrJXh
 jlSEMpK8zxtgdvTEjIdd5oJKtwAeYXkO61wbW9cdAzmGHUyyJa+P3WTUGE6H8tMbo5SGFX
 Xaj7+QOfJxF1/oWQ730DVOG81Vz234s=
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgpPbiA5LzEyLzE5IDEwOjMyIEFNLCBQaWVycmUtTG91cCBBLiBHcmlmZmFpcyB3cm90ZToKPiBP
biA5LzEyLzE5IDEwOjIyIEFNLCBIYXJyeSBXZW50bGFuZCB3cm90ZToKPj4gT24gMjAxOS0wOS0x
MiAxOjAxIHAubS4sIEthemxhdXNrYXMsIE5pY2hvbGFzIHdyb3RlOgo+Pj4gT24gMjAxOS0wOS0x
MiAxMjo0NCBwLm0uLCBQaWVycmUtTG91cCBBLiBHcmlmZmFpcyB3cm90ZToKPj4+PiBJdCdzIG90
aGVyd2lzZSBwcm9wZXJseSBzdXBwb3J0ZWQsIGp1c3QgbmVlZHMgZXhwb3NpbmcgdG8gdXNlcnNw
YWNlLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogUGllcnJlLUxvdXAgQS4gR3JpZmZhaXMgPHBn
cmlmZmFpc0B2YWx2ZXNvZnR3YXJlLmNvbT4KPj4+IEkga25vdyBJR1QgaGFzIHNvbWUgdGVzdHMg
Zm9yIHBsYW5lIHJvdGF0aW9uLCBkbyB5b3UgaGFwcGVuIHRvIGtub3cgd2hhdAo+Pj4gdGVzdHMg
cGFzcyBvciBmYWlsIHdoZW4gZXhwb3NpbmcgdGhpcz8KPj4+Cj4+PiBJIHRoaW5rIERDTjEgKFJh
dmVuKSBzaG91bGQgd29yayBhcyBleHBlY3RlZCBidXQgSSdkIGJlIGNvbmNlcm5lZCBhYm91dAo+
Pj4gRENFIG9yIERDTjIuIEkgdGhpbmsgd2UgaGF2ZSBoYWQgc29tZSBjdXJzb3IgYnVncyBpbiB0
aGUgcGFzdCB3aXRoCj4+PiBjdXJzb3Igcm90YXRpb24gYnV0IHRoZXkgbWlnaHQgb25seSBiZSBl
eHBvc2VkIHdoZW4gdXNlZCBpbiBjb25qdW5jdGlvbgo+Pj4gd2l0aCBvdmVybGF5IHBsYW5lcy4K
Pj4+Cj4+Cj4+IFdpbmRvd3MgZ3V5cyBoYWQgYSBmaXggKGluIERDKSBmb3IgY3Vyc29yIHdpdGgg
SFcgcm90YXRpb24gb24gRENOIGEgZmV3Cj4+IHdlZWtzIGFnby4gVGhhdCBtaWdodCBoYXZlIGZp
eGVkIHRoZXNlIGlzc3Vlcy4KPj4KPj4gV2Ugc2hvdWxkIHN0aWxsIG1ha2Ugc3VyZSB3ZSBjYW4g
cGFzcyBJR1QgdGVzdHMgdGhhdCBkbyByb3RhdGlvbi4KPj4KPj4gSG93IGRpZCB5b3UgdGVzdD8g
V2VzdG9uPwo+IAo+IEkndmUgdGVzdGVkIGl0IHdpdGggYSBwYXRjaGVkIGttc2N1YmUgdG8gYWRk
IHRoZSByb3RhdGlvbiBwcm9wZXJ0eSBpbiAKPiB0aGUgYXRvbWljIHBhdGguIDkwLCAxODAgYW5k
IDI3MCBhbGwgc2VlbSBoYXBweSBvbiBSYXZlbiB3aXRoIHRoYXQgCj4gc2V0dXAuIEkndmUgbm90
IHRlc3RlZCBhbnkgb3RoZXIgY2hpcCBhdCB0aGlzIHBvaW50LgoKSWYgdGhlcmUncyBtb3JlIHRl
c3RpbmcgeW91J2QgbGlrZSBtZSB0byBkbywgd291bGQgYW55b25lIHBvaW50IG1lIGluIAp0aGUg
cmlnaHQgZGlyZWN0aW9uPyBJJ20gbmV3IHRvIGFsbCB0aGlzLCBzb3JyeS4KClRoYW5rcywKICAt
IFBpZXJyZS1Mb3VwCgo+IAo+Pgo+PiBIYXJyeQo+Pgo+Pj4gSSdkIGp1c3QgbGlrZSB0byBtYWtl
IHN1cmUgdGhlcmUncyBzdWl0YWJsZSB0ZXN0aW5nIGF0IGxlYXN0IGlmIHdlJ3JlCj4+PiBnb2lu
ZyB0byBleHBvc2UgdGhpcyB0byB1c2Vyc3BhY2UuCj4+Pgo+Pj4gTmljaG9sYXMgS2F6bGF1c2th
cwo+Pj4KPj4+PiAtLS0KPj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMgfCA4ICsrKysrKysrCj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyAKPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPj4+PiBpbmRleCA0NWJlN2EyMTMyYmIu
LjM3NzI3NjNjNjQ0OSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+Pj4+IEBAIC00NjgwLDYgKzQ2ODAsNyBAQCBz
dGF0aWMgaW50IGFtZGdwdV9kbV9wbGFuZV9pbml0KHN0cnVjdCAKPj4+PiBhbWRncHVfZGlzcGxh
eV9tYW5hZ2VyICpkbSwKPj4+PiDCoMKgwqDCoMKgwqAgdWludDMyX3QgZm9ybWF0c1szMl07Cj4+
Pj4gwqDCoMKgwqDCoMKgIGludCBudW1fZm9ybWF0czsKPj4+PiDCoMKgwqDCoMKgwqAgaW50IHJl
cyA9IC1FUEVSTTsKPj4+PiArwqDCoMKgIHVuc2lnbmVkIGludCBzdXBwb3J0ZWRfcm90YXRpb25z
Owo+Pj4+IMKgwqDCoMKgwqDCoCBudW1fZm9ybWF0cyA9IGdldF9wbGFuZV9mb3JtYXRzKHBsYW5l
LCBwbGFuZV9jYXAsIGZvcm1hdHMsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgQVJSQVlfU0laRShmb3JtYXRzKSk7Cj4+Pj4gQEAgLTQ3MTEsNiArNDcx
MiwxMyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9wbGFuZV9pbml0KHN0cnVjdCAKPj4+PiBhbWRn
cHVfZGlzcGxheV9tYW5hZ2VyICpkbSwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IERSTV9DT0xPUl9ZQ0JDUl9CVDcwOSwgRFJNX0NPTE9SX1lDQkNSX0xJTUlURURfUkFOR0UpOwo+
Pj4+IMKgwqDCoMKgwqDCoCB9Cj4+Pj4gK8KgwqDCoCBzdXBwb3J0ZWRfcm90YXRpb25zID0KPj4+
PiArwqDCoMKgwqDCoMKgwqAgRFJNX01PREVfUk9UQVRFXzAgfCBEUk1fTU9ERV9ST1RBVEVfOTAg
fAo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBEUk1fTU9ERV9ST1RBVEVfMTgwIHwgRFJNX01PREVfUk9U
QVRFXzI3MDsKPj4+PiArCj4+Pj4gK8KgwqDCoCBkcm1fcGxhbmVfY3JlYXRlX3JvdGF0aW9uX3By
b3BlcnR5KHBsYW5lLCBEUk1fTU9ERV9ST1RBVEVfMCwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3VwcG9ydGVkX3JvdGF0aW9ucyk7Cj4+Pj4gKwo+
Pj4+IMKgwqDCoMKgwqDCoCBkcm1fcGxhbmVfaGVscGVyX2FkZChwbGFuZSwgJmRtX3BsYW5lX2hl
bHBlcl9mdW5jcyk7Cj4+Pj4gwqDCoMKgwqDCoMKgIC8qIENyZWF0ZSAocmVzZXQpIHRoZSBwbGFu
ZSBzdGF0ZSAqLwo+Pj4+Cj4+Pgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
