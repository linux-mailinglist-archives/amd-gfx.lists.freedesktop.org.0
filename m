Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 445D02C9138
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Nov 2020 23:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F27E6E906;
	Mon, 30 Nov 2020 22:36:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E456E906;
 Mon, 30 Nov 2020 22:36:14 +0000 (UTC)
Received: by mail-oo1-xc44.google.com with SMTP id h10so3058288ooi.10;
 Mon, 30 Nov 2020 14:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2hkKSZ7MgTmpR98LdQFBKc6bH1HMiPPL7sx2H+5Kgc0=;
 b=dItdnB4nCK4SKp6j5TDLCJ7A0YFRrhbaSql4ME2c88F4qFesT3c+QwwWb8ubQCo7Ym
 KI2tCmzYCUDdDBZFdW8ZhW54+Tawo4P4YvZCGzBGEEE0qiYv5yfMho3hoJ0P6tw6oKhR
 95wugzX7jULn/hof5tvQ27xudGeCAF96foFHBAMCXuiTNSuu2OKO5NHmIwUY7Kp+zuVj
 CwnF68LP4fB5h5+yvi/Nxt6gyS2NQAOb7/xgkymieQQo7lNfG/CJpOmtHADTRwaSJjWj
 80eWhJoHg4De80h7FYkN8jYRmY9oT3co97ajbvhGLvmjW1imRySmxWdLoiw5uiRb3oSd
 Hryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2hkKSZ7MgTmpR98LdQFBKc6bH1HMiPPL7sx2H+5Kgc0=;
 b=bnmN9JOejGcKwX5F1YyzkUwt/j4elFvY/OYrEJP1hFs683VCcDD46SXbEWdA8+GXk+
 Ul30SQLDok7gR3C/YfQHcrSDVebDY6fMOc2rjwCsx3zTgUHZmd09jQTIlRl00Vd35P0p
 IXeKlwI5pSeWIciaSIl9i8lHY5QJYRUqIvwI4KtE25yIz6qpbE0GEtQFmEimgUwUrBu1
 ypMKInDn75vCckhFr3bFwQzI6uKhp2JTtUyIz4sZqhabgDiAVRO4I5o8Li1HzJGk2QgJ
 LQ4TcZdeFAXDfkE5Wr4NYm3JDYOT401V+ZI1sCEveoZ5ipSLT8voBmaPuA7yG3b7qjVw
 JkQg==
X-Gm-Message-State: AOAM533SQlHgY6uutfCLmEE35UZ4kGJWD2X/QFQSud3VSpzTlWQwrn9D
 +hnnAsOmCAt3+/BNnSPqNaAgsCM6zbtJrmlXTcAMBvJ/
X-Google-Smtp-Source: ABdhPJyb+a3B1yzI38iiFCRcP1XfLEAD1ilXbwaTnGQd+h9Dteyp8uncFq5K9oyN7TMZJIxYrP9hyqudYz38V3hh6AM=
X-Received: by 2002:a4a:d5d3:: with SMTP id a19mr17136481oot.61.1606775773775; 
 Mon, 30 Nov 2020 14:36:13 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-26-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-26-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:36:02 -0500
Message-ID: <CADnq5_MCOhY0UEQCkGNNQCNpGN6YJphOp=GJdFgpgow7DVcqHw@mail.gmail.com>
Subject: Re: [PATCH 25/40] drm/amd/amdgpu/amdgpu_vce: Provide some missing and
 repair other function params
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYzo5
Nzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnc2l6ZScgbm90IGRlc2Ny
aWJlZCBpbiAnYW1kZ3B1X3ZjZV9zd19pbml0Jwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdmNlLmM6NDQxOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVy
ICdibycgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X3ZjZV9nZXRfY3JlYXRlX21zZycKPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jOjQ0MTogd2FybmluZzogRXhjZXNz
IGZ1bmN0aW9uIHBhcmFtZXRlciAnYWRldicgZGVzY3JpcHRpb24gaW4gJ2FtZGdwdV92Y2VfZ2V0
X2NyZWF0ZV9tc2cnCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYzo1
MjE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2RpcmVjdCcgbm90IGRl
c2NyaWJlZCBpbiAnYW1kZ3B1X3ZjZV9nZXRfZGVzdHJveV9tc2cnCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYzo1MjE6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbiBw
YXJhbWV0ZXIgJ2FkZXYnIGRlc2NyaXB0aW9uIGluICdhbWRncHVfdmNlX2dldF9kZXN0cm95X21z
ZycKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jOjU4ODogd2Fybmlu
ZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnaWJfaWR4JyBub3QgZGVzY3JpYmVkIGlu
ICdhbWRncHVfdmNlX3ZhbGlkYXRlX2JvJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdmNlLmM6NjM2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdp
Yl9pZHgnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV92Y2VfY3NfcmVsb2MnCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYzo2MzY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ2luZGV4JyBub3QgZGVzY3JpYmVkIGluICdhbWRncHVfdmNlX2Nz
X3JlbG9jJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmM6NzIwOiB3
YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpYl9pZHgnIG5vdCBkZXNjcmli
ZWQgaW4gJ2FtZGdwdV92Y2VfcmluZ19wYXJzZV9jcycKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZjZS5jOjk1Njogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1l
bWJlciAnaWJfaWR4JyBub3QgZGVzY3JpYmVkIGluICdhbWRncHVfdmNlX3JpbmdfcGFyc2VfY3Nf
dm0nCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYzoxMDUwOiB3YXJu
aW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdqb2InIG5vdCBkZXNjcmliZWQgaW4g
J2FtZGdwdV92Y2VfcmluZ19lbWl0X2liJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdmNlLmM6MTA1MDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAn
ZmxhZ3MnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV92Y2VfcmluZ19lbWl0X2liJwo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmM6MTA2Njogd2FybmluZzogRnVuY3Rp
b24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYWRkcicgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X3Zj
ZV9yaW5nX2VtaXRfZmVuY2UnCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
Y2UuYzoxMDY2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdzZXEnIG5v
dCBkZXNjcmliZWQgaW4gJ2FtZGdwdV92Y2VfcmluZ19lbWl0X2ZlbmNlJwo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmM6MTA2Njogd2FybmluZzogRnVuY3Rpb24gcGFy
YW1ldGVyIG9yIG1lbWJlciAnZmxhZ3MnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV92Y2Vfcmlu
Z19lbWl0X2ZlbmNlJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmM6
MTA2Njogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnZmVuY2UnIGRlc2NyaXB0
aW9uIGluICdhbWRncHVfdmNlX3JpbmdfZW1pdF9mZW5jZScKPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZjZS5jOjExMjI6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBv
ciBtZW1iZXIgJ3RpbWVvdXQnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV92Y2VfcmluZ190ZXN0
X2liJwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBD
YzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+
IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBs
aW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZCB3aXRoIG1pbm9yIGZpeGVzLiAgVGhhbmtz
IQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5j
IHwgMTkgKysrKysrKysrKysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dmNlLmMKPiBpbmRleCBlY2FhMmQ3NDgzYjIwLi4xZDhkYjMxOGIwNzU4IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYwo+IEBAIC05MCw2ICs5MCw3IEBAIHN0YXRp
YyBpbnQgYW1kZ3B1X3ZjZV9nZXRfZGVzdHJveV9tc2coc3RydWN0IGFtZGdwdV9yaW5nICpyaW5n
LCB1aW50MzJfdCBoYW5kbGUsCj4gICAqIGFtZGdwdV92Y2VfaW5pdCAtIGFsbG9jYXRlIG1lbW9y
eSwgbG9hZCB2Y2UgZmlybXdhcmUKPiAgICoKPiAgICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9p
bnRlcgo+ICsgKiBAc2l6ZTogc2l6ZSBmb3IgdGhlIG5ldyBCTwo+ICAgKgo+ICAgKiBGaXJzdCBz
dGVwIHRvIGdldCBWQ0Ugb25saW5lLCBhbGxvY2F0ZSBtZW1vcnkgYW5kIGxvYWQgdGhlIGZpcm13
YXJlCj4gICAqLwo+IEBAIC00MjgsOSArNDI5LDkgQEAgdm9pZCBhbWRncHVfdmNlX2ZyZWVfaGFu
ZGxlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGRybV9maWxlICpmaWxwKQo+
ICAvKioKPiAgICogYW1kZ3B1X3ZjZV9nZXRfY3JlYXRlX21zZyAtIGdlbmVyYXRlIGEgVkNFIGNy
ZWF0ZSBtc2cKPiAgICoKPiAtICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICAgKiBA
cmluZzogcmluZyB3ZSBzaG91bGQgc3VibWl0IHRoZSBtc2cgdG8KPiAgICogQGhhbmRsZTogVkNF
IHNlc3Npb24gaGFuZGxlIHRvIHVzZQo+ICsgKiBAYm86IGFtZGdwdSBvYmplY3QgZm9yIHdoaWNo
IHdlIHF1ZXJ5IHRoZSBvZmZzZXQKPiAgICogQGZlbmNlOiBvcHRpb25hbCBmZW5jZSB0byByZXR1
cm4KPiAgICoKPiAgICogT3BlbiB1cCBhIHN0cmVhbSBmb3IgSFcgdGVzdAo+IEBAIC01MDksOSAr
NTEwLDkgQEAgc3RhdGljIGludCBhbWRncHVfdmNlX2dldF9jcmVhdGVfbXNnKHN0cnVjdCBhbWRn
cHVfcmluZyAqcmluZywgdWludDMyX3QgaGFuZGxlLAo+ICAvKioKPiAgICogYW1kZ3B1X3ZjZV9n
ZXRfZGVzdHJveV9tc2cgLSBnZW5lcmF0ZSBhIFZDRSBkZXN0cm95IG1zZwo+ICAgKgo+IC0gKiBA
YWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gICAqIEByaW5nOiByaW5nIHdlIHNob3VsZCBz
dWJtaXQgdGhlIG1zZyB0bwo+ICAgKiBAaGFuZGxlOiBWQ0Ugc2Vzc2lvbiBoYW5kbGUgdG8gdXNl
Cj4gKyAqIEBkaXJlY3Q6IGRpcmVjdCBvciBkZWxheWVkIHBvb2wKPiAgICogQGZlbmNlOiBvcHRp
b25hbCBmZW5jZSB0byByZXR1cm4KPiAgICoKPiAgICogQ2xvc2UgdXAgYSBzdHJlYW0gZm9yIEhX
IHRlc3Qgb3IgaWYgdXNlcnNwYWNlIGZhaWxlZCB0byBkbyBzbwo+IEBAIC01NzYsNiArNTc3LDcg
QEAgc3RhdGljIGludCBhbWRncHVfdmNlX2dldF9kZXN0cm95X21zZyhzdHJ1Y3QgYW1kZ3B1X3Jp
bmcgKnJpbmcsIHVpbnQzMl90IGhhbmRsZSwKPiAgICogYW1kZ3B1X3ZjZV9jc192YWxpZGF0ZV9i
byAtIG1ha2Ugc3VyZSBub3QgdG8gY3Jvc3MgNEdCIGJvdW5kYXJ5Cj4gICAqCj4gICAqIEBwOiBw
YXJzZXIgY29udGV4dAo+ICsgKiBAaWJfaWR4OiBpbmRpcmVjdCBidWZmZXIgdG8gdXNlCj4gICAq
IEBsbzogYWRkcmVzcyBvZiBsb3dlciBkd29yZAo+ICAgKiBAaGk6IGFkZHJlc3Mgb2YgaGlnaGVy
IGR3b3JkCj4gICAqIEBzaXplOiBtaW5pbXVtIHNpemUKPiBAQCAtNjI1LDkgKzYyNywxMSBAQCBz
dGF0aWMgaW50IGFtZGdwdV92Y2VfdmFsaWRhdGVfYm8oc3RydWN0IGFtZGdwdV9jc19wYXJzZXIg
KnAsIHVpbnQzMl90IGliX2lkeCwKPiAgICogYW1kZ3B1X3ZjZV9jc19yZWxvYyAtIGNvbW1hbmQg
c3VibWlzc2lvbiByZWxvY2F0aW9uCj4gICAqCj4gICAqIEBwOiBwYXJzZXIgY29udGV4dAo+ICsg
KiBAaWJfaWR4OiBpbmRpcmVjdCBidWZmZXIgdG8gdXNlCj4gICAqIEBsbzogYWRkcmVzcyBvZiBs
b3dlciBkd29yZAo+ICAgKiBAaGk6IGFkZHJlc3Mgb2YgaGlnaGVyIGR3b3JkCj4gICAqIEBzaXpl
OiBtaW5pbXVtIHNpemUKPiArICogQGluZGV4OiBicy9mYiBpbmRleAo+ICAgKgo+ICAgKiBQYXRj
aCByZWxvY2F0aW9uIGluc2lkZSBjb21tYW5kIHN0cmVhbSB3aXRoIHJlYWwgYnVmZmVyIGFkZHJl
c3MKPiAgICovCj4gQEAgLTcxNCw3ICs3MTgsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92Y2VfdmFs
aWRhdGVfaGFuZGxlKHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLAo+ICAgKiBhbWRncHVfdmNl
X2NzX3BhcnNlIC0gcGFyc2UgYW5kIHZhbGlkYXRlIHRoZSBjb21tYW5kIHN0cmVhbQo+ICAgKgo+
ICAgKiBAcDogcGFyc2VyIGNvbnRleHQKPiAtICoKPiArICogQGliX2lkeDogaW5kaXJlY3QgYnVm
ZmVyIHRvIHVzZQo+ICAgKi8KPiAgaW50IGFtZGdwdV92Y2VfcmluZ19wYXJzZV9jcyhzdHJ1Y3Qg
YW1kZ3B1X2NzX3BhcnNlciAqcCwgdWludDMyX3QgaWJfaWR4KQo+ICB7Cj4gQEAgLTk1MCw3ICs5
NTQsNyBAQCBpbnQgYW1kZ3B1X3ZjZV9yaW5nX3BhcnNlX2NzKHN0cnVjdCBhbWRncHVfY3NfcGFy
c2VyICpwLCB1aW50MzJfdCBpYl9pZHgpCj4gICAqIGFtZGdwdV92Y2VfY3NfcGFyc2Vfdm0gLSBw
YXJzZSB0aGUgY29tbWFuZCBzdHJlYW0gaW4gVk0gbW9kZQo+ICAgKgo+ICAgKiBAcDogcGFyc2Vy
IGNvbnRleHQKPiAtICoKPiArICogQGliX2lkeDogaW5kaXJlY3QgYnVmZmVyIHRvIHVzZQo+ICAg
Ki8KPiAgaW50IGFtZGdwdV92Y2VfcmluZ19wYXJzZV9jc192bShzdHJ1Y3QgYW1kZ3B1X2NzX3Bh
cnNlciAqcCwgdWludDMyX3QgaWJfaWR4KQo+ICB7Cj4gQEAgLTEwNDAsNyArMTA0NCw5IEBAIGlu
dCBhbWRncHVfdmNlX3JpbmdfcGFyc2VfY3Nfdm0oc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAs
IHVpbnQzMl90IGliX2lkeCkKPiAgICogYW1kZ3B1X3ZjZV9yaW5nX2VtaXRfaWIgLSBleGVjdXRl
IGluZGlyZWN0IGJ1ZmZlcgo+ICAgKgo+ICAgKiBAcmluZzogZW5naW5lIHRvIHVzZQo+ICsgKiBA
am9iOiBqb2IgdG8gcmV0cml2ZSB2bWlkIGZyb20KPiAgICogQGliOiB0aGUgSUIgdG8gZXhlY3V0
ZQo+ICsgKiBAZmxhZ3M6IHVudXNlZAo+ICAgKgo+ICAgKi8KPiAgdm9pZCBhbWRncHVfdmNlX3Jp
bmdfZW1pdF9pYihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsCj4gQEAgLTEwNTgsNyArMTA2NCw5
IEBAIHZvaWQgYW1kZ3B1X3ZjZV9yaW5nX2VtaXRfaWIoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5n
LAo+ICAgKiBhbWRncHVfdmNlX3JpbmdfZW1pdF9mZW5jZSAtIGFkZCBhIGZlbmNlIGNvbW1hbmQg
dG8gdGhlIHJpbmcKPiAgICoKPiAgICogQHJpbmc6IGVuZ2luZSB0byB1c2UKPiAtICogQGZlbmNl
OiB0aGUgZmVuY2UKPiArICogQGFkZHI6IGFkZHJlc3MKPiArICogQHNlcTogc2VxdWVuY2UgbnVt
YmVyCj4gKyAqIEBmbGFnczogZmVuY2UgcmVsYXRlZCBmbGFncwo+ICAgKgo+ICAgKi8KPiAgdm9p
ZCBhbWRncHVfdmNlX3JpbmdfZW1pdF9mZW5jZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHU2
NCBhZGRyLCB1NjQgc2VxLAo+IEBAIC0xMTE2LDYgKzExMjQsNyBAQCBpbnQgYW1kZ3B1X3ZjZV9y
aW5nX3Rlc3RfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCj4gICAqIGFtZGdwdV92Y2Vf
cmluZ190ZXN0X2liIC0gdGVzdCBpZiBWQ0UgSUJzIGFyZSB3b3JraW5nCj4gICAqCj4gICAqIEBy
aW5nOiB0aGUgZW5naW5lIHRvIHRlc3Qgb24KPiArICogQHRpbWVvdXQ6IHRpbWVvdXQgdmFsdWUg
aW4gamlmZmllcywgb3IgTUFYX1NDSEVEVUxFX1RJTUVPVVQKPiAgICoKPiAgICovCj4gIGludCBh
bWRncHVfdmNlX3JpbmdfdGVzdF9pYihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIGxvbmcgdGlt
ZW91dCkKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eAo=
