Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335378A6E8
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 21:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C7D6E5BE;
	Mon, 12 Aug 2019 19:12:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A10A6E5BE
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 19:12:19 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z23so569352wmf.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 12:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=apbAL4bSVv67PGoGtoHTeH2N4gIj+D4W9/qqrVzFfjQ=;
 b=JpcwbfzdycEhfUZ40hKE3fcXH1aWZde+1u9LFXr/gVV0S3OQ5YaRtzJOLIFIf3gHiT
 IQ6QadfKWmxPpsf4OJAY0QJ14Z9WxL1BPGrozUQngyIv5DKIo4zLvVhpiW/ovkk9f9dR
 PfPx1EkqpfYBggBpXM7JupLyrS8TkQGu56vdqkxnqZ9ermx8jAC5avrn7fYfYo1r4h6t
 bdAbyEAkk/wf+sbonQoJXWiFK2cIsWaBjOMDrwAUWLSdfMZTK4a3xaXASi4fNpxaAVYZ
 VV6uNc2Hr8R6k/3nu3AYTF0WMHDjD2DseiJMsbAU6nXJZS3KtSNf+dEH0IRB/+pQAdZd
 Xr9g==
X-Gm-Message-State: APjAAAXgkmJ1VeowBm7xAmHSAA40j59aycr0FRfZf8ST8eWIdKO0WZ7t
 rHC6MSSWPCLig1YsFJ0qleUPq85Y
X-Google-Smtp-Source: APXvYqwIP/mysbxeOvcZB3ZH9WDM0ooOwmlexu9Y6eHzLo2Hc5tp6EJiBzB+SnMaaur239p6wdwX+Q==
X-Received: by 2002:a7b:cc0c:: with SMTP id f12mr800484wmh.100.1565637137566; 
 Mon, 12 Aug 2019 12:12:17 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id v23sm335953wmj.32.2019.08.12.12.12.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 12:12:17 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Add more page fault info printing for GFX10
To: "Zhao, Yong" <Yong.Zhao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190812190536.22744-1-Yong.Zhao@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b8fd8285-12f8-373d-022f-e846dbb99efc@gmail.com>
Date: Mon, 12 Aug 2019 21:12:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812190536.22744-1-Yong.Zhao@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=apbAL4bSVv67PGoGtoHTeH2N4gIj+D4W9/qqrVzFfjQ=;
 b=ueu76szTQdjYR3rcmjOxUFnThM5/GVujz8MYAIaCT2wKMILScb7O2dAFWC1rUfwGfF
 p5AAoG8Oup5o3fIXBddVSQHKen9ZgxJ3SaIUVnYZ0MwV90/lMcc370rTW27CbWcuojOH
 6/8oY8B4a+4EC+tqGONE0PYHPjyYljH00406WdZs2GPU+Rm4fIfht8XPzxLYHDInPxwt
 ywxuoHNDRME53M4lrsnSIX9nuxsyHqyRFcoj8fd3MaC6gnGYGom/8CDf2VGLWT79+rfw
 aigv3M15n1PNtArNaSE8M4y2xEhdAGg+weOnmzNgqwI8/mVQCMuQScnhY7uSRF2bf6pO
 itJQ==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTIuMDguMTkgdW0gMjE6MDUgc2NocmllYiBaaGFvLCBZb25nOgo+IFRoZSBwcmludGluZyB3
ZSBkaWQgZm9yIEdGWDkgd2FzIG5vdCBwcm9wb2dhdGVkIHRvIEdGWDEwIHNvbWVob3csIHNvIGZp
eAo+IGl0IG5vdy4KPgo+IENoYW5nZS1JZDogSWMwYjgzODExMzQzNDBiODNjZDY5YzNmZTE4NmFj
N2E4YTk3YjFiY2EKPiBTaWduZWQtb2ZmLWJ5OiBZb25nIFpoYW8gPFlvbmcuWmhhb0BhbWQuY29t
Pgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgfCAzMyAr
KysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3Y5XzAuYyAgfCAgNSArKystCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAu
Ywo+IGluZGV4IDRlM2FjMTA4NGE5NC4uZjIzYmU5OGU5ODk3IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKPiBAQCAtMTQwLDE3ICsxNDAsNDAgQEAgc3RhdGljIGlu
dCBnbWNfdjEwXzBfcHJvY2Vzc19pbnRlcnJ1cHQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
Cj4gICAJfQo+ICAgCj4gICAJaWYgKHByaW50a19yYXRlbGltaXQoKSkgewo+ICsJCXN0cnVjdCBh
bWRncHVfdGFza19pbmZvIHRhc2tfaW5mbzsKPiArCj4gKwkJbWVtc2V0KCZ0YXNrX2luZm8sIDAs
IHNpemVvZihzdHJ1Y3QgYW1kZ3B1X3Rhc2tfaW5mbykpOwo+ICsJCWFtZGdwdV92bV9nZXRfdGFz
a19pbmZvKGFkZXYsIGVudHJ5LT5wYXNpZCwgJnRhc2tfaW5mbyk7Cj4gKwo+ICAgCQlkZXZfZXJy
KGFkZXYtPmRldiwKPiAtCQkJIlslc10gVk1DIHBhZ2UgZmF1bHQgKHNyY19pZDoldSByaW5nOiV1
IHZtaWQ6JXUgcGFzaWQ6JXUpXG4iLAo+ICsJCQkiWyVzXSBwYWdlIGZhdWx0IChzcmNfaWQ6JXUg
cmluZzoldSB2bWlkOiV1IHBhc2lkOiV1LCAiCj4gKwkJCSJmb3IgcHJvY2VzczolcyBwaWQ6JWQg
dGhyZWFkOiVzIHBpZDolZClcbiIsCj4gICAJCQllbnRyeS0+dm1pZF9zcmMgPyAibW1odWIiIDog
ImdmeGh1YiIsCj4gICAJCQllbnRyeS0+c3JjX2lkLCBlbnRyeS0+cmluZ19pZCwgZW50cnktPnZt
aWQsCj4gLQkJCWVudHJ5LT5wYXNpZCk7Cj4gLQkJZGV2X2VycihhZGV2LT5kZXYsICIgIGF0IHBh
Z2UgMHglMDE2bGx4IGZyb20gJWRcbiIsCj4gKwkJCWVudHJ5LT5wYXNpZCwgdGFza19pbmZvLnBy
b2Nlc3NfbmFtZSwgdGFza19pbmZvLnRnaWQsCj4gKwkJCXRhc2tfaW5mby50YXNrX25hbWUsIHRh
c2tfaW5mby5waWQpOwo+ICsJCWRldl9lcnIoYWRldi0+ZGV2LCAiICBpbiBwYWdlIHN0YXJ0aW5n
IGF0IGFkZHJlc3MgMHglMDE2bGx4IGZyb20gY2xpZW50ICVkXG4iLAo+ICAgCQkJYWRkciwgZW50
cnktPmNsaWVudF9pZCk7Cj4gLQkJaWYgKCFhbWRncHVfc3Jpb3ZfdmYoYWRldikpCj4gKwkJaWYg
KCFhbWRncHVfc3Jpb3ZfdmYoYWRldikpIHsKPiAgIAkJCWRldl9lcnIoYWRldi0+ZGV2LAo+IC0J
CQkJIlZNX0wyX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTOjB4JTA4WFxuIiwKPiArCQkJCSJHQ1ZN
X0wyX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTOjB4JTA4WFxuIiwKPiAgIAkJCQlzdGF0dXMpOwo+
ICsJCQlkZXZfZXJyKGFkZXYtPmRldiwgIlx0IE1PUkVfRkFVTFRTOiAweCVseFxuIiwKPiArCQkJ
CVJFR19HRVRfRklFTEQoc3RhdHVzLAo+ICsJCQkJR0NWTV9MMl9QUk9URUNUSU9OX0ZBVUxUX1NU
QVRVUywgTU9SRV9GQVVMVFMpKTsKPiArCQkJZGV2X2VycihhZGV2LT5kZXYsICJcdCBXQUxLRVJf
RVJST1I6IDB4JWx4XG4iLAo+ICsJCQkJUkVHX0dFVF9GSUVMRChzdGF0dXMsCj4gKwkJCQlHQ1ZN
X0wyX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTLCBXQUxLRVJfRVJST1IpKTsKPiArCQkJZGV2X2Vy
cihhZGV2LT5kZXYsICJcdCBQRVJNSVNTSU9OX0ZBVUxUUzogMHglbHhcbiIsCj4gKwkJCQlSRUdf
R0VUX0ZJRUxEKHN0YXR1cywKPiArCQkJCUdDVk1fTDJfUFJPVEVDVElPTl9GQVVMVF9TVEFUVVMs
IFBFUk1JU1NJT05fRkFVTFRTKSk7Cj4gKwkJCWRldl9lcnIoYWRldi0+ZGV2LCAiXHQgTUFQUElO
R19FUlJPUjogMHglbHhcbiIsCj4gKwkJCQlSRUdfR0VUX0ZJRUxEKHN0YXR1cywKPiArCQkJCUdD
Vk1fTDJfUFJPVEVDVElPTl9GQVVMVF9TVEFUVVMsIE1BUFBJTkdfRVJST1IpKTsKPiArCQkJZGV2
X2VycihhZGV2LT5kZXYsICJcdCBSVzogMHglbHhcbiIsCj4gKwkJCQlSRUdfR0VUX0ZJRUxEKHN0
YXR1cywKPiArCQkJCUdDVk1fTDJfUFJPVEVDVElPTl9GQVVMVF9TVEFUVVMsIFJXKSk7Cj4gKwkJ
fQo+ICAgCX0KPiAgIAo+ICAgCXJldHVybiAwOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3Y5XzAuYwo+IGluZGV4IDI5NmUyZDk4MjU3OC4uMzRjNGMyZDA4NTUwIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCj4gQEAgLTM2NCw3ICszNjQsNyBAQCBzdGF0aWMg
aW50IGdtY192OV8wX3Byb2Nlc3NfaW50ZXJydXB0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LAo+ICAgCj4gICAJCWRldl9lcnIoYWRldi0+ZGV2LAo+ICAgCQkJIlslc10gJXMgcGFnZSBmYXVs
dCAoc3JjX2lkOiV1IHJpbmc6JXUgdm1pZDoldSAiCj4gLQkJCSJwYXNpZDoldSwgZm9yIHByb2Nl
c3MgJXMgcGlkICVkIHRocmVhZCAlcyBwaWQgJWQpXG4iLAo+ICsJCQkicGFzaWQ6JXUsIGZvciBw
cm9jZXNzOiVzIHBpZDolZCB0aHJlYWQ6JXMgcGlkOiVkKVxuIiwKCkkgdGhpbmsgdGhlIHRleHQg
YWN0dWFsbHkgbG9va3MgYmV0dGVyIHdpdGhvdXQgdGhlICI6Ii4KCj4gICAJCQlodWJfbmFtZSwg
cmV0cnlfZmF1bHQgPyAicmV0cnkiIDogIm5vLXJldHJ5IiwKPiAgIAkJCWVudHJ5LT5zcmNfaWQs
IGVudHJ5LT5yaW5nX2lkLCBlbnRyeS0+dm1pZCwKPiAgIAkJCWVudHJ5LT5wYXNpZCwgdGFza19p
bmZvLnByb2Nlc3NfbmFtZSwgdGFza19pbmZvLnRnaWQsCj4gQEAgLTM4Nyw2ICszODcsOSBAQCBz
dGF0aWMgaW50IGdtY192OV8wX3Byb2Nlc3NfaW50ZXJydXB0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LAo+ICAgCQkJZGV2X2VycihhZGV2LT5kZXYsICJcdCBNQVBQSU5HX0VSUk9SOiAweCVs
eFxuIiwKPiAgIAkJCQlSRUdfR0VUX0ZJRUxEKHN0YXR1cywKPiAgIAkJCQlWTV9MMl9QUk9URUNU
SU9OX0ZBVUxUX1NUQVRVUywgTUFQUElOR19FUlJPUikpOwo+ICsJCQlkZXZfZXJyKGFkZXYtPmRl
diwgIlx0IFJXOiAweCVseFxuIiwKPiArCQkJCVJFR19HRVRfRklFTEQoc3RhdHVzLAo+ICsJCQkJ
Vk1fTDJfUFJPVEVDVElPTl9GQVVMVF9TVEFUVVMsIFJXKSk7CgpUaGF0IHNob3VsZCBwcm9iYWJs
eSBiZSBhIHNlcGFyYXRlIHBhdGNoIHNpbmNlIGl0IGlzIGZpeGluZyBnZng5LgoKQXBhcnQgZnJv
bSB0aGF0IHRoZSBwYXRjaCBsb29rcyBnb29kIHRvIG1lLApDaHJpc3RpYW4uCgo+ICAgCj4gICAJ
CX0KPiAgIAl9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
