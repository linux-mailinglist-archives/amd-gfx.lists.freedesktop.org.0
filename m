Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0914C10D2B0
	for <lists+amd-gfx@lfdr.de>; Fri, 29 Nov 2019 09:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CFF6E0EE;
	Fri, 29 Nov 2019 08:52:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130CD6E0EE
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 Nov 2019 08:52:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z7so30623308wrl.13
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 Nov 2019 00:52:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=axRdmfD17E3IQj6fq9KJTvkqjdqlzQRBODP/Ktmr21A=;
 b=EgobZS9+GH6ZYQuCEr/+7yqCMsjwGIGoert1g/Pz8W6YES+BGDyrTgr/uLpVVuTM4S
 UBFTTu30faFOxw/vYRo53vjiYwLzHCHuTKeYTEg+f+2wqsHAdoxSu1cnQdiji/9aqTa2
 GpzEOkP9I2HwcXzEiaM31yrwDAiIVm3/WSSQS1s6y2o1HeiKRyqE829QI5Onuw0VGhQI
 AK4V/XqOkmEZ3Dk89zbk32gKk349txqz47QbPYYeSyScyTmIDbisgjl+k40g3JUe5E45
 ULUNovII9rLsWIizBwXTTfO1JxmcFqqJiH1//QmjQMhUXoh750CKpHc/+iSGsmUXgJuf
 VANw==
X-Gm-Message-State: APjAAAVXl7gPz9Ruy1s12d0t4LHYjHgAmcWJGacTkKezq1X6EwfEixxr
 LIDpjcSCA3cxEzG9Q18qbT8=
X-Google-Smtp-Source: APXvYqyy10vukOih+KvmT26yJmK6QsQV5B/gswMtJI+41GqUrYNqv1HFhLNS3HMUsa+dkyh5gMNuag==
X-Received: by 2002:a5d:56d1:: with SMTP id m17mr23892007wrw.222.1575017525658; 
 Fri, 29 Nov 2019 00:52:05 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b17sm27151472wrp.49.2019.11.29.00.52.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Nov 2019 00:52:05 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu: not remove sysfs if not create sysfs
To: Nirmoy <nirmodas@amd.com>, amd-gfx@lists.freedesktop.org
References: <20191129082616.4979-1-yttao@amd.com>
 <ad5ba95b-b242-fd0f-1beb-14475a3616cf@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6d605368-b371-6df0-c9d2-23c225f8aeb7@gmail.com>
Date: Fri, 29 Nov 2019 09:52:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ad5ba95b-b242-fd0f-1beb-14475a3616cf@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=axRdmfD17E3IQj6fq9KJTvkqjdqlzQRBODP/Ktmr21A=;
 b=oFxsQJjfY+JAe0o1QFj7Qk2I1JkeTWJAp+XK7WHI0WtV9LMOT6O2PUP2W3m4N/YP+M
 uDNNrRpzq6Q9agbKBNZqsuXmpNJAdXnMu25mpxZh8h02/F8L1IfGNJRJr+YqIZaoY/qP
 50lzPig7Cxmlw4jdXHf6BcIuQhxxwwhSP9L52LRZSu6D2SgEea+GxQ5LP8xlnKgPhBAB
 hv63iCGDc7eoeUYEKesuH1rGNmwRRkLXIlHTySLG2Kk7m6+KapJmTD41rTDl4HD283C7
 6q3B4730HycucqZGSv9CE94ALeM5c43py227N1pNOJlDeA6cO57dYIZRuoGj56EDLPmK
 mcNw==
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
Reply-To: christian.koenig@amd.com
Cc: luben.tuikov@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2VsbCB3aGF0IHdlIGRvIGhlcmUgYWN0dWFsbHkgbG9va3MgbGlrZSBjb21wbGV0ZSBvdmVya2ls
bCB0byBtZS4KCklJUkMgd2hlbiB0aGUgZGV2aWNlIGlzIHJlbW92ZWQgYWxsIHN1YnNlcXVlbnQg
c3lzZnMgZGlyZWN0b3JpZXMgYXJlIApyZW1vdmVkIGF1dG9tYXRpY2FsbHkgYXMgd2VsbC4KClNv
IGNhbGxpbmcgc3lzZnNfcmVtb3ZlX2dyb3VwKCkgaXMgc3VwZXJmbG91cyBpbiB0aGUgZmlyc3Qg
cGxhY2UuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgpBbSAyOS4xMS4xOSB1bSAwOTozNCBzY2hyaWVi
IE5pcm1veToKPiBMdWJlbiwgVGhpcyBzaG91bGQgdGFrZSBjYXJlIG9mIHRoZSB3YXJuaW5ncyB0
aGF0IHlvdSBnZXQgd2hlbiBhIG5hdmkgCj4gZncgZmlsZSBpcyBtaXNzaW5nIGZyb20gaW5pdHJk
Lgo+Cj4KPiBSZWdhcmRzLAo+Cj4gTmlybW95Cj4KPiBPbiAxMS8yOS8xOSA5OjI2IEFNLCBZaW50
aWFuIFRhbyB3cm90ZToKPj4gV2hlbiBsb2FkIGFtZGdwdSBmYWlsZWQgYmVmb3JlIGNyZWF0ZSBw
bV9zeXNmcyBhbmQgdWNvZGVfc3lzZnMsCj4+IHRoZSBwbV9zeXNmcyBhbmQgdWNvZGVfc3lzZnMg
c2hvdWxkIG5vdCBiZSByZW1vdmVkLgo+PiBPdGhlcndpc2UsIHRoZXJlIHdpbGwgYmUgd2Fybmlu
ZyBjYWxsIHRyYWNlIGp1c3QgbGlrZSBiZWxvdy4KPj4gW8KgwqAgMjQuODM2Mzg2XSBbZHJtXSBW
Q0UgaW5pdGlhbGl6ZWQgc3VjY2Vzc2Z1bGx5Lgo+PiBbwqDCoCAyNC44NDEzNTJdIGFtZGdwdSAw
MDAwOjAwOjA3LjA6IGFtZGdwdV9kZXZpY2VfaXBfaW5pdCBmYWlsZWQKPj4gW8KgwqAgMjUuMzcw
MzgzXSBhbWRncHUgMDAwMDowMDowNy4wOiBGYXRhbCBlcnJvciBkdXJpbmcgR1BVIGluaXQKPj4g
W8KgwqAgMjUuODg5NTc1XSBbZHJtXSBhbWRncHU6IGZpbmlzaGluZyBkZXZpY2UuCj4+IFvCoMKg
IDI2LjA2OTEyOF0gYW1kZ3B1IDAwMDA6MDA6MDcuMDogW2RybTphbWRncHVfcmluZ190ZXN0X2hl
bHBlciAKPj4gW2FtZGdwdV1dICpFUlJPUiogcmluZyBraXFfMi4xLjAgdGVzdCBmYWlsZWQgKC0x
MTApCj4+IFvCoMKgIDI2LjA3MDExMF0gW2RybTpnZnhfdjlfMF9od19maW5pIFthbWRncHVdXSAq
RVJST1IqIEtDUSBkaXNhYmxlIAo+PiBmYWlsZWQKPj4gW8KgwqAgMjYuMjAwMzA5XSBbVFRNXSBG
aW5hbGl6aW5nIHBvb2wgYWxsb2NhdG9yCj4+IFvCoMKgIDI2LjIwMDMxNF0gW1RUTV0gRmluYWxp
emluZyBETUEgcG9vbCBhbGxvY2F0b3IKPj4gW8KgwqAgMjYuMjAwMzQ5XSBbVFRNXSBab25lwqAg
a2VybmVsOiBVc2VkIG1lbW9yeSBhdCBleGl0OiAwIEtpQgo+PiBbwqDCoCAyNi4yMDAzNTFdIFtU
VE1dIFpvbmXCoMKgIGRtYTMyOiBVc2VkIG1lbW9yeSBhdCBleGl0OiAwIEtpQgo+PiBbwqDCoCAy
Ni4yMDAzNTNdIFtkcm1dIGFtZGdwdTogdHRtIGZpbmFsaXplZAo+PiBbwqDCoCAyNi4yMDUzMjld
IC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+PiBbwqDCoCAyNi4yMDUzMzBd
IHN5c2ZzIGdyb3VwICdmd192ZXJzaW9uJyBub3QgZm91bmQgZm9yIGtvYmplY3QgCj4+ICcwMDAw
OjAwOjA3LjAnCj4+IFvCoMKgIDI2LjIwNTM0N10gV0FSTklORzogQ1BVOiAwIFBJRDogMTIyOCBh
dCBmcy9zeXNmcy9ncm91cC5jOjI1NiAKPj4gc3lzZnNfcmVtb3ZlX2dyb3VwKzB4ODAvMHg5MAo+
PiBbwqDCoCAyNi4yMDUzNDhdIE1vZHVsZXMgbGlua2VkIGluOiBhbWRncHUoT0UrKSBncHVfc2No
ZWQoT0UpIHR0bShPRSkgCj4+IGRybV9rbXNfaGVscGVyKE9FKSBkcm0oT0UpIGkyY19hbGdvX2Jp
dCBmYl9zeXNfZm9wcyBzeXNjb3B5YXJlYSAKPj4gc3lzZmlsbHJlY3Qgc3lzaW1nYmx0IHJwY3Nl
Y19nc3Nfa3JiNSBhdXRoX3JwY2dzcyBuZnN2NCBuZnMgbG9ja2QgCj4+IGdyYWNlIGZzY2FjaGUg
YmluZm10X21pc2Mgc25kX2hkYV9jb2RlY19nZW5lcmljIGxlZHRyaWdfYXVkaW8gCj4+IGNyY3Qx
MGRpZl9wY2xtdWwgc25kX2hkYV9pbnRlbCBjcmMzMl9wY2xtdWwgc25kX2hkYV9jb2RlYyAKPj4g
Z2hhc2hfY2xtdWxuaV9pbnRlbCBzbmRfaGRhX2NvcmUgc25kX2h3ZGVwIHNuZF9wY20gc25kX3Rp
bWVyIAo+PiBpbnB1dF9sZWRzIHNuZCBqb3lkZXYgc291bmRjb3JlIHNlcmlvX3JhdyBwY3Nwa3Ig
ZXZidWcgYWVzbmlfaW50ZWwgCj4+IGFlc194ODZfNjQgY3J5cHRvX3NpbWQgY3J5cHRkIG1hY19o
aWQgZ2x1ZV9oZWxwZXIgc3VucnBjIGlwX3RhYmxlcyAKPj4geF90YWJsZXMgYXV0b2ZzNCA4MTM5
dG9vIHBzbW91c2UgODEzOWNwIG1paSBpMmNfcGlpeDQgcGF0YV9hY3BpIGZsb3BweQo+PiBbwqDC
oCAyNi4yMDUzNjldIENQVTogMCBQSUQ6IDEyMjggQ29tbTogbW9kcHJvYmUgVGFpbnRlZDogR8Kg
wqDCoMKgwqDCoMKgwqDCoMKgIAo+PiBPRcKgwqDCoMKgIDUuMi4wLXJjMSAjMQo+PiBbwqDCoCAy
Ni4yMDUzNzBdIEhhcmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMgKGk0NDBGWCArIFBJSVgs
IDE5OTYpLCAKPj4gQklPUyBVYnVudHUtMS44LjItMXVidW50dTEgMDQvMDEvMjAxNAo+PiBbwqDC
oCAyNi4yMDUzNzJdIFJJUDogMDAxMDpzeXNmc19yZW1vdmVfZ3JvdXArMHg4MC8weDkwCj4+IFvC
oMKgIDI2LjIwNTM3NF0gQ29kZTogZTggMzUgYjkgZmYgZmYgNWIgNDEgNWMgNDEgNWQgNWQgYzMg
NDggODkgZGYgZTggCj4+IGY2IGI1IGZmIGZmIGViIGM2IDQ5IDhiIDU1IDAwIDQ5IDhiIDM0IDI0
IDQ4IGM3IGM3IDQ4IDdhIDcwIDk4IGU4IDYwIAo+PiA2MyBkMyBmZiA8MGY+IDBiIGViIGQ3IDY2
IDkwIDY2IDJlIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIDBmIDFmIDQ0IAo+PiAwMCAwMCA1NQo+
PiBbwqDCoCAyNi4yMDUzNzVdIFJTUDogMDAxODpmZmZmYmVlMjQyYjBiOTA4IEVGTEFHUzogMDAw
MTAyODIKPj4gW8KgwqAgMjYuMjA1Mzc2XSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiAwMDAw
MDAwMDAwMDAwMDAwIFJDWDogCj4+IDAwMDAwMDAwMDAwMDAwMDYKPj4gW8KgwqAgMjYuMjA1Mzc3
XSBSRFg6IDAwMDAwMDAwMDAwMDAwMDcgUlNJOiAwMDAwMDAwMDAwMDAwMDkyIFJESTogCj4+IGZm
ZmY5N2FkNmY4MTczODAKPj4gW8KgwqAgMjYuMjA1Mzc3XSBSQlA6IGZmZmZiZWUyNDJiMGI5MjAg
UjA4OiBmZmZmZmZmZjk4ZjUyMGM0IFIwOTogCj4+IDAwMDAwMDAwMDAwMDAyYjMKPj4gW8KgwqAg
MjYuMjA1Mzc4XSBSMTA6IGZmZmZiZWUyNDJiMGI4ZjggUjExOiAwMDAwMDAwMDAwMDAwMmIzIFIx
MjogCj4+IGZmZmZmZmZmYzBlNTgyNDAKPj4gW8KgwqAgMjYuMjA1Mzc5XSBSMTM6IGZmZmY5N2Fk
NmQxZmUwYjAgUjE0OiBmZmZmOTdhZDRkYjk1NGM4IFIxNTogCj4+IGZmZmY5N2FkNGRiN2ZmZjAK
Pj4gW8KgwqAgMjYuMjA1MzgwXSBGUzrCoCAwMDAwN2ZmM2Q4YTFjNGMwKDAwMDApIEdTOmZmZmY5
N2FkNmY4MDAwMDAoMDAwMCkgCj4+IGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKPj4gW8KgwqAgMjYu
MjA1MzgxXSBDUzrCoCAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAz
Mwo+PiBbwqDCoCAyNi4yMDUzODFdIENSMjogMDAwMDdmOWIyZWYxZGYwNCBDUjM6IDAwMDAwMDA0
MmFhYjgwMDEgQ1I0OiAKPj4gMDAwMDAwMDAwMDM2MDZmMAo+PiBbwqDCoCAyNi4yMDUzODRdIERS
MDogMDAwMDAwMDAwMDAwMDAwMCBEUjE6IDAwMDAwMDAwMDAwMDAwMDAgRFIyOiAKPj4gMDAwMDAw
MDAwMDAwMDAwMAo+PiBbwqDCoCAyNi4yMDUzODVdIERSMzogMDAwMDAwMDAwMDAwMDAwMCBEUjY6
IDAwMDAwMDAwZmZmZTBmZjAgRFI3OiAKPj4gMDAwMDAwMDAwMDAwMDQwMAo+PiBbwqDCoCAyNi4y
MDUzODVdIENhbGwgVHJhY2U6Cj4+IFvCoMKgIDI2LjIwNTQ2MV3CoCBhbWRncHVfdWNvZGVfc3lz
ZnNfZmluaSsweDE4LzB4MjAgW2FtZGdwdV0KPj4gW8KgwqAgMjYuMjA1NTE4XcKgIGFtZGdwdV9k
ZXZpY2VfZmluaSsweDNiNC8weDU2MCBbYW1kZ3B1XQo+PiBbwqDCoCAyNi4yMDU1NzNdwqAgYW1k
Z3B1X2RyaXZlcl91bmxvYWRfa21zKzB4NGYvMHhhMCBbYW1kZ3B1XQo+PiBbwqDCoCAyNi4yMDU2
MjNdwqAgYW1kZ3B1X2RyaXZlcl9sb2FkX2ttcysweGNkLzB4MjUwIFthbWRncHVdCj4+IFvCoMKg
IDI2LjIwNTYzN13CoCBkcm1fZGV2X3JlZ2lzdGVyKzB4MTJiLzB4MWMwIFtkcm1dCj4+IFvCoMKg
IDI2LjIwNTY5NV3CoCBhbWRncHVfcGNpX3Byb2JlKzB4MTJhLzB4MWUwIFthbWRncHVdCj4+IFvC
oMKgIDI2LjIwNTY5OV3CoCBsb2NhbF9wY2lfcHJvYmUrMHg0Ny8weGEwCj4+IFvCoMKgIDI2LjIw
NTcwMV3CoCBwY2lfZGV2aWNlX3Byb2JlKzB4MTA2LzB4MWIwCj4+IFvCoMKgIDI2LjIwNTcwNF3C
oCByZWFsbHlfcHJvYmUrMHgyMWEvMHgzZjAKPj4gW8KgwqAgMjYuMjA1NzA2XcKgIGRyaXZlcl9w
cm9iZV9kZXZpY2UrMHgxMWMvMHgxNDAKPj4gW8KgwqAgMjYuMjA1NzA3XcKgIGRldmljZV9kcml2
ZXJfYXR0YWNoKzB4NTgvMHg2MAo+PiBbwqDCoCAyNi4yMDU3MDldwqAgX19kcml2ZXJfYXR0YWNo
KzB4YzMvMHgxNDAKPj4KPj4gU2lnbmVkLW9mZi1ieTogWWludGlhbiBUYW8gPHl0dGFvQGFtZC5j
b20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaMKgwqDC
oMKgwqDCoMKgIHzCoCAzICsrKwo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMgfCAxNiArKysrKysrKysrKystLS0tCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwg
MTUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdS5oCj4+IGluZGV4IGMzYTM5NGQ4NDFhOC4uOTU4ZTgwMDVhNmNjIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAo+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAo+PiBAQCAtMTA0MSw2ICsxMDQxLDkg
QEAgc3RydWN0IGFtZGdwdV9kZXZpY2Ugewo+PiDCoCDCoMKgwqDCoMKgIHVpbnQ2NF90wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB1bmlxdWVfaWQ7Cj4+IMKgwqDCoMKgwqAgdWludDY0X3QgZGZfcGVy
Zm1vbl9jb25maWdfYXNzaWduX21hc2tbQU1ER1BVX01BWF9ERl9QRVJGTU9OU107Cj4+ICsKPj4g
K8KgwqDCoCBib29swqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBtX3N5c2ZzX2VuOwo+
PiArwqDCoMKgIGJvb2zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWNvZGVfc3lzZnNf
ZW47Cj4+IMKgIH07Cj4+IMKgIMKgIHN0YXRpYyBpbmxpbmUgc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFtZGdwdV90dG1fYWRldihzdHJ1Y3QgCj4+IHR0bV9ib19kZXZpY2UgKmJkZXYpCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgCj4+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4+IGluZGV4IGU3YTE3
NWE2YTQ0OC4uM2RhMWY4NGRiMjc0IDEwMDc1NQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jCj4+IEBAIC0zMDEzLDEyICszMDEzLDE4IEBAIGludCBhbWRncHVf
ZGV2aWNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgCj4+ICphZGV2LAo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgYW1kZ3B1X3BtX3ZpcnRfc3lzZnNfaW5pdChhZGV2KTsKPj4gwqAgwqDCoMKgwqDC
oCByID0gYW1kZ3B1X3BtX3N5c2ZzX2luaXQoYWRldik7Cj4+IC3CoMKgwqAgaWYgKHIpCj4+ICvC
oMKgwqAgaWYgKHIpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGFkZXYtPnBtX3N5c2ZzX2VuID0gZmFs
c2U7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1fRVJST1IoInJlZ2lzdGVyaW5nIHBtIGRlYnVn
ZnMgZmFpbGVkICglZCkuXG4iLCByKTsKPj4gK8KgwqDCoCB9IGVsc2UKPj4gK8KgwqDCoMKgwqDC
oMKgIGFkZXYtPnBtX3N5c2ZzX2VuID0gdHJ1ZTsKPj4gwqAgwqDCoMKgwqDCoCByID0gYW1kZ3B1
X3Vjb2RlX3N5c2ZzX2luaXQoYWRldik7Cj4+IC3CoMKgwqAgaWYgKHIpCj4+ICvCoMKgwqAgaWYg
KHIpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGFkZXYtPnVjb2RlX3N5c2ZzX2VuID0gZmFsc2U7Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1fRVJST1IoIkNyZWF0aW5nIGZpcm13YXJlIHN5c2ZzIGZh
aWxlZCAoJWQpLlxuIiwgcik7Cj4+ICvCoMKgwqAgfSBlbHNlCj4+ICvCoMKgwqDCoMKgwqDCoCBh
ZGV2LT51Y29kZV9zeXNmc19lbiA9IHRydWU7Cj4+IMKgIMKgwqDCoMKgwqAgciA9IGFtZGdwdV9k
ZWJ1Z2ZzX2dlbV9pbml0KGFkZXYpOwo+PiDCoMKgwqDCoMKgIGlmIChyKQo+PiBAQCAtMzExMyw3
ICszMTE5LDggQEAgdm9pZCBhbWRncHVfZGV2aWNlX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
Cj4+ICphZGV2KQo+PiDCoCAjZW5kaWYKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgYW1k
Z3B1X2ZlbmNlX2RyaXZlcl9maW5pKGFkZXYpOwo+PiAtwqDCoMKgIGFtZGdwdV9wbV9zeXNmc19m
aW5pKGFkZXYpOwo+PiArwqDCoMKgIGlmIChhZGV2LT5wbV9zeXNmc19lbikKPj4gK8KgwqDCoMKg
wqDCoMKgIGFtZGdwdV9wbV9zeXNmc19maW5pKGFkZXYpOwo+PiDCoMKgwqDCoMKgIGFtZGdwdV9m
YmRldl9maW5pKGFkZXYpOwo+PiDCoMKgwqDCoMKgIHIgPSBhbWRncHVfZGV2aWNlX2lwX2Zpbmko
YWRldik7Cj4+IMKgwqDCoMKgwqAgaWYgKGFkZXYtPmZpcm13YXJlLmdwdV9pbmZvX2Z3KSB7Cj4+
IEBAIC0zMTQ4LDcgKzMxNTUsOCBAQCB2b2lkIGFtZGdwdV9kZXZpY2VfZmluaShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAKPj4gKmFkZXYpCj4+IMKgIMKgwqDCoMKgwqAgYW1kZ3B1X2RlYnVnZnNfcmVn
c19jbGVhbnVwKGFkZXYpOwo+PiDCoMKgwqDCoMKgIGRldmljZV9yZW1vdmVfZmlsZShhZGV2LT5k
ZXYsICZkZXZfYXR0cl9wY2llX3JlcGxheV9jb3VudCk7Cj4+IC3CoMKgwqAgYW1kZ3B1X3Vjb2Rl
X3N5c2ZzX2ZpbmkoYWRldik7Cj4+ICvCoMKgwqAgaWYgKGFkZXYtPnVjb2RlX3N5c2ZzX2VuKQo+
PiArwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X3Vjb2RlX3N5c2ZzX2ZpbmkoYWRldik7Cj4+IMKgwqDC
oMKgwqAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1BFUkZfRVZFTlRTKSkKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIGFtZGdwdV9wbXVfZmluaShhZGV2KTsKPj4gwqDCoMKgwqDCoCBhbWRncHVfZGVidWdm
c19wcmVlbXB0X2NsZWFudXAoYWRldik7Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
