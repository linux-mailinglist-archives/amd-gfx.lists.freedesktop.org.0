Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD9BB13CC
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 19:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE956EDDF;
	Thu, 12 Sep 2019 17:35:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-72.mimecast.com
 (us-smtp-delivery-72.mimecast.com [63.128.21.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60926EDDF
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 17:35:18 +0000 (UTC)
Received: from smtp01.valvesoftware.com (smtp01.valvesoftware.com
 [208.64.203.181]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-5VbN77tOMciWdzUAbEY1jw-1; Thu, 12 Sep 2019 13:35:16 -0400
Received: from [172.16.1.107] (helo=antispam.valve.org)
 by smtp01.valvesoftware.com with esmtp (Exim 4.86_2)
 (envelope-from <pgriffais@valvesoftware.com>) id 1i8Szz-00084p-DA
 for amd-gfx@lists.freedesktop.org; Thu, 12 Sep 2019 10:35:15 -0700
Received: from antispam.valve.org (127.0.0.1) id hfa0t60171sk for
 <amd-gfx@lists.freedesktop.org>;
 Thu, 12 Sep 2019 10:35:15 -0700 (envelope-from <pgriffais@valvesoftware.com>)
Received: from mail1.valvemail.org ([172.16.144.22])
 by antispam.valve.org ([172.16.1.107]) (SonicWALL 9.0.5.2081 )
 with ESMTP id o201909121735150067963-5; Thu, 12 Sep 2019 10:35:15 -0700
Received: from [172.18.21.27] (172.18.21.27) by mail1.valvemail.org
 (172.16.144.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1415.2; Thu, 12 Sep
 2019 10:34:38 -0700
Subject: Re: [PATCH] drm/amd/display: Create plane rotation property
To: Harry Wentland <hwentlan@amd.com>, "Kazlauskas, Nicholas"
 <Nicholas.Kazlauskas@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
References: <20190912164404.12725-1-pgriffais@valvesoftware.com>
 <b781b06d-a52f-0291-b0df-d90b81a66c84@amd.com>
 <907ff2ce-e273-1ea0-a17b-522745756164@amd.com>
From: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
Message-ID: <9cc53c0f-db53-96a1-32de-a2303c3b62d9@valvesoftware.com>
Date: Thu, 12 Sep 2019 10:32:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <907ff2ce-e273-1ea0-a17b-522745756164@amd.com>
Content-Language: en-US
X-ClientProxiedBy: mail1.valvemail.org (172.16.144.22) To mail1.valvemail.org
 (172.16.144.22)
X-EXCLAIMER-MD-CONFIG: fe5cb8ea-1338-4c54-81e0-ad323678e037
X-Mlf-CnxnMgmt-Allow: 172.16.144.22
X-Mlf-Version: 9.0.5.2081
X-Mlf-License: BSVKCAP__
X-Mlf-UniqueId: o201909121735150067963
X-MC-Unique: 5VbN77tOMciWdzUAbEY1jw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=valvesoftware.com; 
 s=mc20150811; t=1568309717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8VGkNSB9wjmXXANJ5VWeS82di05bTmT38jiILb1MmUI=;
 b=Dz3UlQ1QC+yyXyfn0AzWz9DPw+HlDOGZQPJCkUcSiNxly8meaOwiUkmZ+8u4aI0ytgfo92
 /VGGhZqZHtS3Jo/Uqzw8i51ZjKBX722Avc3X5uT6L8Jd+HeAKVeYEUm4KXbKU+CaOjnrSq
 L393dXIUM0yjGKqPpI28YQc8QEXmZzo=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gOS8xMi8xOSAxMDoyMiBBTSwgSGFycnkgV2VudGxhbmQgd3JvdGU6Cj4gT24gMjAxOS0wOS0x
MiAxOjAxIHAubS4sIEthemxhdXNrYXMsIE5pY2hvbGFzIHdyb3RlOgo+PiBPbiAyMDE5LTA5LTEy
IDEyOjQ0IHAubS4sIFBpZXJyZS1Mb3VwIEEuIEdyaWZmYWlzIHdyb3RlOgo+Pj4gSXQncyBvdGhl
cndpc2UgcHJvcGVybHkgc3VwcG9ydGVkLCBqdXN0IG5lZWRzIGV4cG9zaW5nIHRvIHVzZXJzcGFj
ZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmUtTG91cCBBLiBHcmlmZmFpcyA8cGdyaWZm
YWlzQHZhbHZlc29mdHdhcmUuY29tPgo+PiBJIGtub3cgSUdUIGhhcyBzb21lIHRlc3RzIGZvciBw
bGFuZSByb3RhdGlvbiwgZG8geW91IGhhcHBlbiB0byBrbm93IHdoYXQKPj4gdGVzdHMgcGFzcyBv
ciBmYWlsIHdoZW4gZXhwb3NpbmcgdGhpcz8KPj4KPj4gSSB0aGluayBEQ04xIChSYXZlbikgc2hv
dWxkIHdvcmsgYXMgZXhwZWN0ZWQgYnV0IEknZCBiZSBjb25jZXJuZWQgYWJvdXQKPj4gRENFIG9y
IERDTjIuIEkgdGhpbmsgd2UgaGF2ZSBoYWQgc29tZSBjdXJzb3IgYnVncyBpbiB0aGUgcGFzdCB3
aXRoCj4+IGN1cnNvciByb3RhdGlvbiBidXQgdGhleSBtaWdodCBvbmx5IGJlIGV4cG9zZWQgd2hl
biB1c2VkIGluIGNvbmp1bmN0aW9uCj4+IHdpdGggb3ZlcmxheSBwbGFuZXMuCj4+Cj4gCj4gV2lu
ZG93cyBndXlzIGhhZCBhIGZpeCAoaW4gREMpIGZvciBjdXJzb3Igd2l0aCBIVyByb3RhdGlvbiBv
biBEQ04gYSBmZXcKPiB3ZWVrcyBhZ28uIFRoYXQgbWlnaHQgaGF2ZSBmaXhlZCB0aGVzZSBpc3N1
ZXMuCj4gCj4gV2Ugc2hvdWxkIHN0aWxsIG1ha2Ugc3VyZSB3ZSBjYW4gcGFzcyBJR1QgdGVzdHMg
dGhhdCBkbyByb3RhdGlvbi4KPiAKPiBIb3cgZGlkIHlvdSB0ZXN0PyBXZXN0b24/CgpJJ3ZlIHRl
c3RlZCBpdCB3aXRoIGEgcGF0Y2hlZCBrbXNjdWJlIHRvIGFkZCB0aGUgcm90YXRpb24gcHJvcGVy
dHkgaW4gCnRoZSBhdG9taWMgcGF0aC4gOTAsIDE4MCBhbmQgMjcwIGFsbCBzZWVtIGhhcHB5IG9u
IFJhdmVuIHdpdGggdGhhdCAKc2V0dXAuIEkndmUgbm90IHRlc3RlZCBhbnkgb3RoZXIgY2hpcCBh
dCB0aGlzIHBvaW50LgoKPiAKPiBIYXJyeQo+IAo+PiBJJ2QganVzdCBsaWtlIHRvIG1ha2Ugc3Vy
ZSB0aGVyZSdzIHN1aXRhYmxlIHRlc3RpbmcgYXQgbGVhc3QgaWYgd2UncmUKPj4gZ29pbmcgdG8g
ZXhwb3NlIHRoaXMgdG8gdXNlcnNwYWNlLgo+Pgo+PiBOaWNob2xhcyBLYXpsYXVza2FzCj4+Cj4+
PiAtLS0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgfCA4ICsrKysrKysrCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jCj4+PiBpbmRleCA0NWJlN2EyMTMyYmIuLjM3NzI3NjNjNjQ0OSAxMDA2NDQKPj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMK
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMKPj4+IEBAIC00NjgwLDYgKzQ2ODAsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9wbGFuZV9p
bml0KHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSwKPj4+ICAgIAl1aW50MzJfdCBm
b3JtYXRzWzMyXTsKPj4+ICAgIAlpbnQgbnVtX2Zvcm1hdHM7Cj4+PiAgICAJaW50IHJlcyA9IC1F
UEVSTTsKPj4+ICsJdW5zaWduZWQgaW50IHN1cHBvcnRlZF9yb3RhdGlvbnM7Cj4+PiAgICAKPj4+
ICAgIAludW1fZm9ybWF0cyA9IGdldF9wbGFuZV9mb3JtYXRzKHBsYW5lLCBwbGFuZV9jYXAsIGZv
cm1hdHMsCj4+PiAgICAJCQkJCUFSUkFZX1NJWkUoZm9ybWF0cykpOwo+Pj4gQEAgLTQ3MTEsNiAr
NDcxMiwxMyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9wbGFuZV9pbml0KHN0cnVjdCBhbWRncHVf
ZGlzcGxheV9tYW5hZ2VyICpkbSwKPj4+ICAgIAkJCURSTV9DT0xPUl9ZQ0JDUl9CVDcwOSwgRFJN
X0NPTE9SX1lDQkNSX0xJTUlURURfUkFOR0UpOwo+Pj4gICAgCX0KPj4+ICAgIAo+Pj4gKwlzdXBw
b3J0ZWRfcm90YXRpb25zID0KPj4+ICsJCURSTV9NT0RFX1JPVEFURV8wIHwgRFJNX01PREVfUk9U
QVRFXzkwIHwKPj4+ICsJCURSTV9NT0RFX1JPVEFURV8xODAgfCBEUk1fTU9ERV9ST1RBVEVfMjcw
Owo+Pj4gKwo+Pj4gKwlkcm1fcGxhbmVfY3JlYXRlX3JvdGF0aW9uX3Byb3BlcnR5KHBsYW5lLCBE
Uk1fTU9ERV9ST1RBVEVfMCwKPj4+ICsJCQkJCSAgIHN1cHBvcnRlZF9yb3RhdGlvbnMpOwo+Pj4g
Kwo+Pj4gICAgCWRybV9wbGFuZV9oZWxwZXJfYWRkKHBsYW5lLCAmZG1fcGxhbmVfaGVscGVyX2Z1
bmNzKTsKPj4+ICAgIAo+Pj4gICAgCS8qIENyZWF0ZSAocmVzZXQpIHRoZSBwbGFuZSBzdGF0ZSAq
Lwo+Pj4KPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
