Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED303DB315
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 19:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A59E6E040;
	Thu, 17 Oct 2019 17:14:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216EA6E040
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 17:14:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p4so3235013wrm.8
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 10:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=1FsomER6htC4WRNlx6f8+/W3V175bInrI7TKb0Wgw0Q=;
 b=NJXESU2cbzvbsf7HflRpFcAW6NlNVHmTBZcFTJWfInXNIOqSgUG4s1cAkEJNJv7Ru5
 WRGvM5JzW9Wj8N7z1S1bF2IsmRM8HycsV34nbwoZg5QKHj+YArpcJ+UKe8e5ISMz2TK1
 i23TGKQrTc6l7j6I76s5/hfxlRkrA+vG26dnACeaV7x2u1v4vUiKILxc8huXR/GPyqif
 55llr9SKPq3GKgA5lpqteBikPJNWgWTiVWieTMIl/fKWIcyH1B10E9/JFgM+y7ge+t3Q
 F7cWTQZ2e877i71JDE7VBG9e7vTZ7QVGVj+V2RF9TH1RjPR6B12tkkgW0nyC78XLnc4v
 +f2w==
X-Gm-Message-State: APjAAAXESwR7iTD0UPNbVAKwVE618D+nCSyyqAQpavf529u5A9QFxxpu
 BUueNgtkVkW3ubo1UNwKYZw=
X-Google-Smtp-Source: APXvYqycW/p5oE7pxvVYlnpjwtIfWEmITcTXRRrvFVAOhuA663F0QfPsv9AUEa8b5ILt3U0YibNJVA==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr2228298wrv.281.1571332481779; 
 Thu, 17 Oct 2019 10:14:41 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w7sm2294855wmd.22.2019.10.17.10.14.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Oct 2019 10:14:41 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu/vce: fix allocation size in enc ring test
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20191017154456.335015-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <41db9e54-3e23-118b-264a-623a4231c1f7@gmail.com>
Date: Thu, 17 Oct 2019 19:14:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017154456.335015-1-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=1FsomER6htC4WRNlx6f8+/W3V175bInrI7TKb0Wgw0Q=;
 b=szxz5rt0tlaSfvKa13in7We8JIGVy8Fv8SFR06LslYq5vbl05EHmCdx10DQ7uPRTa4
 geOmruI9TKeVqoXsvwFR0V5TmRU/CnixHpNKBPyljGSdeSyn82qZmo+iZFA7125L599w
 xahar9as9Yw+CVj3IPfRfof6t9exsChvjkPNiAyPenUuaLydwtrHJL8EYUemxQL9OIO3
 wcNWb45c12kIv9e1h6MMzH4PLWHJmhCVOwX5WyW1Vh6Qt9fW7pScv4hLqRKTLRIKkMoU
 qGTVmKpRPTC6fOfHF3wmsQBRlsJ8CqpGIfrVbvd0Uyg3pUNf7asUn5Z0mwOgiAnts7XK
 qzHQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTcuMTAuMTkgdW0gMTc6NDQgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gV2UgbmVlZCB0byBh
bGxvY2F0ZSBhIGxhcmdlIGVub3VnaCBidWZmZXIgZm9yIHRoZQo+IGZlZWRiYWNrIGJ1ZmZlciwg
b3RoZXJ3aXNlIHRoZSBJQiB0ZXN0IGNhbiBvdmVyd3JpdGUKPiBvdGhlciBtZW1vcnkuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CgpB
Y2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiBmb3Ig
dGhlIHNlcmllcy4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dmNlLmMgfCAyMCArKysrKysrKysrKysrKystLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZjZS5oIHwgIDEgKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92Y2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92Y2UuYwo+IGluZGV4IGI3MGIzYzQ1YmIyOS4uNjUwNDRiMWIzZDRjIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYwo+IEBAIC00MjksMTMgKzQyOSwxNCBAQCB2
b2lkIGFtZGdwdV92Y2VfZnJlZV9oYW5kbGVzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBz
dHJ1Y3QgZHJtX2ZpbGUgKmZpbHApCj4gICAgKiBPcGVuIHVwIGEgc3RyZWFtIGZvciBIVyB0ZXN0
Cj4gICAgKi8KPiAgIGludCBhbWRncHVfdmNlX2dldF9jcmVhdGVfbXNnKHN0cnVjdCBhbWRncHVf
cmluZyAqcmluZywgdWludDMyX3QgaGFuZGxlLAo+ICsJCQkgICAgICBzdHJ1Y3QgYW1kZ3B1X2Jv
ICpibywKPiAgIAkJCSAgICAgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5jZSkKPiAgIHsKPiAgIAlj
b25zdCB1bnNpZ25lZCBpYl9zaXplX2R3ID0gMTAyNDsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X2pvYiAq
am9iOwo+ICAgCXN0cnVjdCBhbWRncHVfaWIgKmliOwo+ICAgCXN0cnVjdCBkbWFfZmVuY2UgKmYg
PSBOVUxMOwo+IC0JdWludDY0X3QgZHVtbXk7Cj4gKwl1aW50NjRfdCBhZGRyOwo+ICAgCWludCBp
LCByOwo+ICAgCj4gICAJciA9IGFtZGdwdV9qb2JfYWxsb2Nfd2l0aF9pYihyaW5nLT5hZGV2LCBp
Yl9zaXplX2R3ICogNCwgJmpvYik7Cj4gQEAgLTQ0NCw3ICs0NDUsNyBAQCBpbnQgYW1kZ3B1X3Zj
ZV9nZXRfY3JlYXRlX21zZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IGhhbmRs
ZSwKPiAgIAo+ICAgCWliID0gJmpvYi0+aWJzWzBdOwo+ICAgCj4gLQlkdW1teSA9IGliLT5ncHVf
YWRkciArIDEwMjQ7Cj4gKwlhZGRyID0gYW1kZ3B1X2JvX2dwdV9vZmZzZXQoYm8pOwo+ICAgCj4g
ICAJLyogc3RpdGNoIHRvZ2V0aGVyIGFuIFZDRSBjcmVhdGUgbXNnICovCj4gICAJaWItPmxlbmd0
aF9kdyA9IDA7Cj4gQEAgLTQ3Niw4ICs0NzcsOCBAQCBpbnQgYW1kZ3B1X3ZjZV9nZXRfY3JlYXRl
X21zZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IGhhbmRsZSwKPiAgIAo+ICAg
CWliLT5wdHJbaWItPmxlbmd0aF9kdysrXSA9IDB4MDAwMDAwMTQ7IC8qIGxlbiAqLwo+ICAgCWli
LT5wdHJbaWItPmxlbmd0aF9kdysrXSA9IDB4MDUwMDAwMDU7IC8qIGZlZWRiYWNrIGJ1ZmZlciAq
Lwo+IC0JaWItPnB0cltpYi0+bGVuZ3RoX2R3KytdID0gdXBwZXJfMzJfYml0cyhkdW1teSk7Cj4g
LQlpYi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPSBkdW1teTsKPiArCWliLT5wdHJbaWItPmxlbmd0
aF9kdysrXSA9IHVwcGVyXzMyX2JpdHMoYWRkcik7Cj4gKwlpYi0+cHRyW2liLT5sZW5ndGhfZHcr
K10gPSBhZGRyOwo+ICAgCWliLT5wdHJbaWItPmxlbmd0aF9kdysrXSA9IDB4MDAwMDAwMDE7Cj4g
ICAKPiAgIAlmb3IgKGkgPSBpYi0+bGVuZ3RoX2R3OyBpIDwgaWJfc2l6ZV9kdzsgKytpKQo+IEBA
IC0xMTEwLDEzICsxMTExLDIwIEBAIGludCBhbWRncHVfdmNlX3JpbmdfdGVzdF9yaW5nKHN0cnVj
dCBhbWRncHVfcmluZyAqcmluZykKPiAgIGludCBhbWRncHVfdmNlX3JpbmdfdGVzdF9pYihzdHJ1
Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIGxvbmcgdGltZW91dCkKPiAgIHsKPiAgIAlzdHJ1Y3QgZG1h
X2ZlbmNlICpmZW5jZSA9IE5VTEw7Cj4gKwlzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IE5VTEw7Cj4g
ICAJbG9uZyByOwo+ICAgCj4gICAJLyogc2tpcCB2Y2UgcmluZzEvMiBpYiB0ZXN0IGZvciBub3cs
IHNpbmNlIGl0J3Mgbm90IHJlbGlhYmxlICovCj4gICAJaWYgKHJpbmcgIT0gJnJpbmctPmFkZXYt
PnZjZS5yaW5nWzBdKQo+ICAgCQlyZXR1cm4gMDsKPiAgIAo+IC0JciA9IGFtZGdwdV92Y2VfZ2V0
X2NyZWF0ZV9tc2cocmluZywgMSwgTlVMTCk7Cj4gKwlyID0gYW1kZ3B1X2JvX2NyZWF0ZV9yZXNl
cnZlZChyaW5nLT5hZGV2LCA1MTIsIFBBR0VfU0laRSwKPiArCQkJCSAgICAgIEFNREdQVV9HRU1f
RE9NQUlOX1ZSQU0sCj4gKwkJCQkgICAgICAmYm8sIE5VTEwsIE5VTEwpOwo+ICsJaWYgKHIpCj4g
KwkJcmV0dXJuIHI7Cj4gKwo+ICsJciA9IGFtZGdwdV92Y2VfZ2V0X2NyZWF0ZV9tc2cocmluZywg
MSwgYm8sIE5VTEwpOwo+ICAgCWlmIChyKQo+ICAgCQlnb3RvIGVycm9yOwo+ICAgCj4gQEAgLTEx
MzIsNSArMTE0MCw3IEBAIGludCBhbWRncHVfdmNlX3JpbmdfdGVzdF9pYihzdHJ1Y3QgYW1kZ3B1
X3JpbmcgKnJpbmcsIGxvbmcgdGltZW91dCkKPiAgIAo+ICAgZXJyb3I6Cj4gICAJZG1hX2ZlbmNl
X3B1dChmZW5jZSk7Cj4gKwlhbWRncHVfYm9fdW5yZXNlcnZlKGJvKTsKPiArCWFtZGdwdV9ib191
bnJlZigmYm8pOwo+ICAgCXJldHVybiByOwo+ICAgfQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdmNlLmgKPiBpbmRleCAzMGVhNTRkZDkxMTcuLmU4MDJmN2Q5ZGIwYSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmgKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmgKPiBAQCAtNTksNiArNTksNyBA
QCBpbnQgYW1kZ3B1X3ZjZV9lbnRpdHlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7
Cj4gICBpbnQgYW1kZ3B1X3ZjZV9zdXNwZW5kKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsK
PiAgIGludCBhbWRncHVfdmNlX3Jlc3VtZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Cj4g
ICBpbnQgYW1kZ3B1X3ZjZV9nZXRfY3JlYXRlX21zZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcs
IHVpbnQzMl90IGhhbmRsZSwKPiArCQkJICAgICAgc3RydWN0IGFtZGdwdV9ibyAqYm8sCj4gICAJ
CQkgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICoqZmVuY2UpOwo+ICAgaW50IGFtZGdwdV92Y2VfZ2V0
X2Rlc3Ryb3lfbXNnKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdWludDMyX3QgaGFuZGxlLAo+
ICAgCQkJICAgICAgIGJvb2wgZGlyZWN0LCBzdHJ1Y3QgZG1hX2ZlbmNlICoqZmVuY2UpOwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
