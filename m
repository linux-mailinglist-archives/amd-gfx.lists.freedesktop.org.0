Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31980E77BE
	for <lists+amd-gfx@lfdr.de>; Mon, 28 Oct 2019 18:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941916E99E;
	Mon, 28 Oct 2019 17:38:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056246E99E;
 Mon, 28 Oct 2019 17:38:45 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v9so10824162wrq.5;
 Mon, 28 Oct 2019 10:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/abdfMeh69JGd4VbtyIiDE9TdqwHC99pC3PmG4mB0mM=;
 b=Uu7nb3BabRRi8TQVYD0ivXkXfnmDbtBsYEvwVBA5KhcNdr/PdtV47VNQ65K7N8Gv5q
 D0QV4edJUGujXjdGwfKaEx7yUjTd3pNiNuP13lctzTs1t6AazyEQfidaDD+jiKmv0YH/
 mQmhy+8+MmgbaE0mJ+52tsnvy1i4lKnonl62yTY7HYwWgrh7QB7Eg7rxxEBiBu7S/XR/
 POnzcpjGeuRRRL0iZazF+4uxA49VvaOguMonQWcfKCuceHRL3Phw/0N4hzEUBsA4Fo0K
 0E/NCvUBXtwRbXxlrRE4NgpRyJcKNQbxxatB6l7EuS79lPLtqKJ7RJujL9kUMP34X2KE
 kK6A==
X-Gm-Message-State: APjAAAVb3XJf7yb5CZkRemzcuuEyyodr7LmUX6RPPhT3HZQVmrzXzDFL
 Ts64H46VS0JgixQprIh9WVpKHrGrU/vzxvI6gNU=
X-Google-Smtp-Source: APXvYqzNVtJKGE9q81/oRf5ZwQumvlLTJEqW1bel2VkuWj7p2Up2WDnp6z7jwoabvfpAicTQNz60RJ782dusFNfdH3E=
X-Received: by 2002:adf:fb0b:: with SMTP id c11mr16644596wrr.50.1572284323451; 
 Mon, 28 Oct 2019 10:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191023075831.33636-1-yuehaibing@huawei.com>
In-Reply-To: <20191023075831.33636-1-yuehaibing@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Oct 2019 13:38:30 -0400
Message-ID: <CADnq5_PPCFLZzMCUxW4Ofd5+A=N5s-iMURrSEj8C6V1NJhS68A@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu: remove set but not used variable 'adev'
To: YueHaibing <yuehaibing@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/abdfMeh69JGd4VbtyIiDE9TdqwHC99pC3PmG4mB0mM=;
 b=GeR8JMjiSUF7m8r1MKUax3fCHeqthfouXEYEWz5WsEdfFvaiWAnICzAA35OtNXpruS
 JT/J34izCxkastgRcpKQ+Lb++HdOHK/gS7f18TY/zIVSNZTi/oL/k3+YqCeK+asnhvo8
 slDVdzdtZYK95yQusxFzGeF1q+3BG+9iKu5WQncL6ON2b23YbL1Le6wkbOJIu24Tciau
 hKDHqibxYAUAONFBbeh4uH/mMhMEP01ST298lhS/CKYv4jj7k/VXcVGGfRJMwVCBWO5D
 ZThIsbtmimj7IX53m6lkBiLiHNX+rL+XpkTlzdF6maFjuM9RB/8WjbfUZWtRP3vLAae5
 tfAA==
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
Cc: Chunming Zhou <David1.Zhou@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Yang, Philip" <Philip.Yang@amd.com>,
 Dave Airlie <airlied@linux.ie>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 tiancyin <tianci.yin@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgNDoxMCBBTSBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1
YXdlaS5jb20+IHdyb3RlOgo+Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jOjEyMjE6MjQ6IHdhcm5pbmc6IHZhcmlhYmxlIGFkZXYgc2V0IGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdHRtLmM6NDg4OjI0OiB3YXJuaW5nOiB2YXJpYWJsZSBhZGV2IHNldCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jOjU0NzoyNDogd2FybmluZzogdmFyaWFibGUgYWRldiBzZXQgYnV0IG5vdCB1
c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+Cj4gSXQgaXMgbmV2ZXIgdXNlZCwgc28g
Y2FuIHJlbW92ZWQgaXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5n
QGh1YXdlaS5jb20+CgpBcHBsaWVkLiAgdGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgOSAtLS0tLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDkgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5jCj4gaW5kZXggYTYxYjBkOS4uYmEwMDI2MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmMKPiBAQCAtNDg1LDE1ICs0ODUsMTIgQEAgc3RhdGljIGludCBh
bWRncHVfbW92ZV92cmFtX3JhbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29sIGV2
aWN0LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHR0bV9vcGVyYXRp
b25fY3R4ICpjdHgsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdHRt
X21lbV9yZWcgKm5ld19tZW0pCj4gIHsKPiAtICAgICAgIHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2Owo+ICAgICAgICAgc3RydWN0IHR0bV9tZW1fcmVnICpvbGRfbWVtID0gJmJvLT5tZW07Cj4g
ICAgICAgICBzdHJ1Y3QgdHRtX21lbV9yZWcgdG1wX21lbTsKPiAgICAgICAgIHN0cnVjdCB0dG1f
cGxhY2UgcGxhY2VtZW50czsKPiAgICAgICAgIHN0cnVjdCB0dG1fcGxhY2VtZW50IHBsYWNlbWVu
dDsKPiAgICAgICAgIGludCByOwo+Cj4gLSAgICAgICBhZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KGJv
LT5iZGV2KTsKPiAtCj4gICAgICAgICAvKiBjcmVhdGUgc3BhY2UvcGFnZXMgZm9yIG5ld19tZW0g
aW4gR1RUIHNwYWNlICovCj4gICAgICAgICB0bXBfbWVtID0gKm5ld19tZW07Cj4gICAgICAgICB0
bXBfbWVtLm1tX25vZGUgPSBOVUxMOwo+IEBAIC01NDQsMTUgKzU0MSwxMiBAQCBzdGF0aWMgaW50
IGFtZGdwdV9tb3ZlX3JhbV92cmFtKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wg
ZXZpY3QsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdHRtX29wZXJh
dGlvbl9jdHggKmN0eCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB0
dG1fbWVtX3JlZyAqbmV3X21lbSkKPiAgewo+IC0gICAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXY7Cj4gICAgICAgICBzdHJ1Y3QgdHRtX21lbV9yZWcgKm9sZF9tZW0gPSAmYm8tPm1lbTsK
PiAgICAgICAgIHN0cnVjdCB0dG1fbWVtX3JlZyB0bXBfbWVtOwo+ICAgICAgICAgc3RydWN0IHR0
bV9wbGFjZW1lbnQgcGxhY2VtZW50Owo+ICAgICAgICAgc3RydWN0IHR0bV9wbGFjZSBwbGFjZW1l
bnRzOwo+ICAgICAgICAgaW50IHI7Cj4KPiAtICAgICAgIGFkZXYgPSBhbWRncHVfdHRtX2FkZXYo
Ym8tPmJkZXYpOwo+IC0KPiAgICAgICAgIC8qIG1ha2Ugc3BhY2UgaW4gR1RUIGZvciBvbGRfbWVt
IGJ1ZmZlciAqLwo+ICAgICAgICAgdG1wX21lbSA9ICpuZXdfbWVtOwo+ICAgICAgICAgdG1wX21l
bS5tbV9ub2RlID0gTlVMTDsKPiBAQCAtMTIxOCwxMSArMTIxMiw4IEBAIHN0YXRpYyBzdHJ1Y3Qg
dHRtX2JhY2tlbmRfZnVuYyBhbWRncHVfYmFja2VuZF9mdW5jID0gewo+ICBzdGF0aWMgc3RydWN0
IHR0bV90dCAqYW1kZ3B1X3R0bV90dF9jcmVhdGUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
bywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qg
cGFnZV9mbGFncykKPiAgewo+IC0gICAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXY7Cj4g
ICAgICAgICBzdHJ1Y3QgYW1kZ3B1X3R0bV90dCAqZ3R0Owo+Cj4gLSAgICAgICBhZGV2ID0gYW1k
Z3B1X3R0bV9hZGV2KGJvLT5iZGV2KTsKPiAtCj4gICAgICAgICBndHQgPSBremFsbG9jKHNpemVv
ZihzdHJ1Y3QgYW1kZ3B1X3R0bV90dCksIEdGUF9LRVJORUwpOwo+ICAgICAgICAgaWYgKGd0dCA9
PSBOVUxMKSB7Cj4gICAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+IC0tCj4gMi43LjQKPgo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
