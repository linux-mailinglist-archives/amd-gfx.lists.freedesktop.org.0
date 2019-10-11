Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F77D4110
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 15:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9917F89C54;
	Fri, 11 Oct 2019 13:25:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D0189811
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 13:25:19 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y21so10221568wmi.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 06:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JJo+wpopgvVQr3CK7Js+iAISxGtLBswd4Y2EWa03dNA=;
 b=RY8hAJbSResxjwxEgY9jigrAwp7DWuC0iOuLJNTFnGLiSvYtK6loeIpOFiwKT7S3h5
 i+Jy8W6+CM0D8YGjFGC+XIHJsKdq5TwfzugVFcywAzSE/vegRHWcuu80lnX+LTBbxns2
 9wXObs/Y2w9NzfPcUGGxuc14JfsvY/b5U8oetkyiaQW0joItdOE1LxlNrsZBcavORJH8
 nOL/w4nw5MWcCOH1rTxg+qn+v5pK5BfWIB71YP+RWVgObF5H2oKiEpMGLLY4I7TV/JtW
 vkPpNw0Pq8KrilPQiCTb8yxy7Ph3hEhmIOjtX3BPe2OjrL6aHVRqMlPpmGO2wtbATWc+
 S0hw==
X-Gm-Message-State: APjAAAUGP789mCTeu++u/7g5Eb5rzHzAzFAZt0a05L+0X3RrcdL8tCGF
 YxmOrfhSgXNZkLSkhoAA4ouBybBCvnTCHKjrpK0=
X-Google-Smtp-Source: APXvYqyi2G18upnkU01wkH10MYvJ+oYiXBuhsySNnbXgHWKagrUBYeTiplfuU/iQdnPHLNGp9WYPCcN+vACVlERjcgI=
X-Received: by 2002:a7b:c395:: with SMTP id s21mr3256504wmj.102.1570800318123; 
 Fri, 11 Oct 2019 06:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191010152619.31011-1-alexander.deucher@amd.com>
 <20191010152619.31011-3-alexander.deucher@amd.com>
 <BN8PR12MB3329E4B5DE6B027D43B38F5AE4970@BN8PR12MB3329.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB3329E4B5DE6B027D43B38F5AE4970@BN8PR12MB3329.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 11 Oct 2019 09:25:06 -0400
Message-ID: <CADnq5_Pbi+K=62tY0sJdOARy74wpnh+Owfq3wQb0tcyXE2XtFw@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/amdgpu: move gpu reset out of
 amdgpu_device_suspend
To: "Quan, Evan" <Evan.Quan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=JJo+wpopgvVQr3CK7Js+iAISxGtLBswd4Y2EWa03dNA=;
 b=Ea5qO3Dfu13OZQx7aNvLjY0U/48rnsYJYw/6C146ArkO7Q+beKnJr+3khVij5k3lQT
 I7KjcwUqFK05xrmuDZC0zKcP1/43fZP5JiC+VemjUwU7yUi60xdQadpY9nfJFePCqKgL
 X8FZBuogtKXYU3DVYpiA+RRvfk9j5F0CAfm+McatsxPHdx6Y9e4D/u1RHqXG4g8HvSs4
 Vtmv5Yl33mIlLCjR1bvqUUEiariwa+smg4EubIecTcTBsnNCS1qfiGjcrLfWvDTZr8NZ
 hl8Mr3y4wG06uBFfT/cqeKxlu2VSlZEmklc738FqrKypSuw1QLOYJHIXlk7W2PHIjDtq
 ixiA==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMTI6MDcgQU0gUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFt
ZC5jb20+IHdyb3RlOgo+Cj4gSXQgc2VlbXMgYW1kZ3B1X3Btb3BzX3J1bnRpbWVfc3VzcGVuZCgp
IG5lZWRzIHRvIGJlIHVwZGF0ZWQgYWNjb3JkaW5nbHkgYWxzby4KCkkgcHVycG9zZWx5IGxlZnQg
dGhhdCBvdXQuICBJIHRoaW5rIHRoYXQgaXMgYSBidWcuICBXZSBkb24ndCBuZWVkIHRvCnJlc2V0
IHRoZSBHUFUgZm9yIHJ1bnRpbWUgc3VzcGVuZC4gIFdlIG9ubHkgbmVlZCBpdCBmb3IgaGliZXJu
YXRpb24KYmVjYXVzZSBvZiB0aGUgd2hvbGUgZnJlZXplL3RoYXcgZGFuY2UuCgpBbGV4Cgo+Cj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5j
ZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQWxleCBEZXVjaGVyCj4gU2Vu
dDogVGh1cnNkYXksIE9jdG9iZXIgMTAsIDIwMTkgMTE6MjYgUE0KPiBUbzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1
Y2hlckBhbWQuY29tPgo+IFN1YmplY3Q6IFtQQVRDSCAyLzVdIGRybS9hbWRncHU6IG1vdmUgZ3B1
IHJlc2V0IG91dCBvZiBhbWRncHVfZGV2aWNlX3N1c3BlbmQKPgo+IE1vdmUgaXQgaW50byB0aGUg
Y2FsbGVyLiAgVGhlcmUgYXJlIGNhc2VzIHdlcmUgd2UgZG9uJ3QKPiB3YW50IGl0LiAgV2UgbmVl
ZCBpdCBmb3IgaGliZXJuYXRpb24sIGJ1dCB3ZSBkb24ndCBuZWVkCj4gaXQgZm9yIHJ1bnRpbWUg
cG0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YyB8IDQgLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgICAg
fCA3ICsrKysrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4g
aW5kZXggOWI5YjE1MzYwMTk0Li45MWJkYjI0NmU0MDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gQEAgLTMxNzMsMTAgKzMxNzMsNiBAQCBpbnQg
YW1kZ3B1X2RldmljZV9zdXNwZW5kKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGJvb2wgc3VzcGVu
ZCwgYm9vbCBmYmNvbikKPiAgICAgICAgICAgICAgICAgLyogU2h1dCBkb3duIHRoZSBkZXZpY2Ug
Ki8KPiAgICAgICAgICAgICAgICAgcGNpX2Rpc2FibGVfZGV2aWNlKGRldi0+cGRldik7Cj4gICAg
ICAgICAgICAgICAgIHBjaV9zZXRfcG93ZXJfc3RhdGUoZGV2LT5wZGV2LCBQQ0lfRDNob3QpOwo+
IC0gICAgICAgfSBlbHNlIHsKPiAtICAgICAgICAgICAgICAgciA9IGFtZGdwdV9hc2ljX3Jlc2V0
KGFkZXYpOwo+IC0gICAgICAgICAgICAgICBpZiAocikKPiAtICAgICAgICAgICAgICAgICAgICAg
ICBEUk1fRVJST1IoImFtZGdwdSBhc2ljIHJlc2V0IGZhaWxlZFxuIik7Cj4gICAgICAgICB9Cj4K
PiAgICAgICAgIHJldHVybiAwOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2
LmMKPiBpbmRleCBkNDNjNDZkZTc4MDcuLjY0MTQxMzg2ZTYwMyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPiBAQCAtMTExOCw4ICsxMTE4LDEzIEBAIHN0YXRp
YyBpbnQgYW1kZ3B1X3Btb3BzX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIHN0YXRpYyBp
bnQgYW1kZ3B1X3Btb3BzX2ZyZWV6ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIHsKPiAgICAgICAg
IHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gKyAg
ICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGRybV9kZXYtPmRldl9wcml2YXRlOwo+
ICsgICAgICAgaW50IHI7Cj4KPiAtICAgICAgIHJldHVybiBhbWRncHVfZGV2aWNlX3N1c3BlbmQo
ZHJtX2RldiwgZmFsc2UsIHRydWUpOwo+ICsgICAgICAgciA9IGFtZGdwdV9kZXZpY2Vfc3VzcGVu
ZChkcm1fZGV2LCBmYWxzZSwgdHJ1ZSk7Cj4gKyAgICAgICBpZiAocikKPiArICAgICAgICAgICAg
ICAgcmV0dXJuIHI7Cj4gKyAgICAgICByZXR1cm4gYW1kZ3B1X2FzaWNfcmVzZXQoYWRldik7Cj4g
IH0KPgo+ICBzdGF0aWMgaW50IGFtZGdwdV9wbW9wc190aGF3KHN0cnVjdCBkZXZpY2UgKmRldikK
PiAtLQo+IDIuMjAuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
