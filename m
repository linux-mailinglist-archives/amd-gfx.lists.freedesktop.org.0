Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753C32B1EF8
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Nov 2020 16:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7390C6E4F1;
	Fri, 13 Nov 2020 15:44:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725E16E4F1;
 Fri, 13 Nov 2020 15:44:42 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 23so10372008wrc.8;
 Fri, 13 Nov 2020 07:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dTXSjkwW66Qf03W7taCVtyE00/bGmzmTWZgHOS2++QU=;
 b=FIQrmXH5vYvjWClB6CYn+s0Y9tveyE5WNvjtPebaR6RRiPGQFTVoTmpOl+OoeiMnm8
 UGQ37EQ31z3tpJKoF7rWRJxPe3dlrYBB9bZVzBZOzEBPvLL6OmyuvC3aHeXvY/LW3sKO
 qnop85SORXHZoHyAI0KABsBjru/bOkcbm7CnLaesLfGLOXsDCAHMC8Jre9tk5I36AGH2
 q3n+U/sZIbFbX8Soz/u0chJvuQmH+9TvvtOYxGLuTW3ORmsrH7bFFXtS45Q+SHX+5GMD
 ZzMiIpOpEjz1v4ZgvhMQennl3hOckl3Rb2pkCsFM+tyuljoSOAOxXl4x8tueFOamwUr1
 2tPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dTXSjkwW66Qf03W7taCVtyE00/bGmzmTWZgHOS2++QU=;
 b=R/pocgGRUOH3X5jS8rpc5Ej3HjNVDn7/PE+alsHvUktHV5KuuZe9bLG5jDk3MgwQXf
 LNi6H3Zy09F9ESSGZ0AUSFb/2dvwQXlA9sTgsZlldpnJajx8ztN1GE1Hmuos38j09nTi
 xxqiqvY2AKe0Om8UbjGZsCHOUh1mB1J02myndl1dpCMTXckMyc/K5Pdzqy/rKXHpBeG1
 txrFX6UtFCYa04UFMhGqr6fp7+9Nh7YAQROXWN8vWgXpPM37Gr9+Sn5OGSEhy49ARLA8
 fOBoskwb4Yp2202ZYYIISx89A3CZuHhwkIaM8UXjNWW7ZDqrD1d++cHyP+hkz7+O8azU
 0Ffw==
X-Gm-Message-State: AOAM5306SGyWEu/2V8Rc4QOFS1TSFckv10p3FZ1abnDxwj8U5rKnz4wq
 dt+68ptmK96Hx1ApSb5ifSr3ujXcl/Muu2OMTD4=
X-Google-Smtp-Source: ABdhPJys9RSAV9H/vK2qjqM9/OnR02ua/1fz9p8mD+VHPtiz1Y1bdBgzsXWFtXC4sehX5U0aUIvvc3KfOQLUOwGELco=
X-Received: by 2002:adf:e350:: with SMTP id n16mr4389041wrj.419.1605282275657; 
 Fri, 13 Nov 2020 07:44:35 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-5-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-5-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 10:44:24 -0500
Message-ID: <CADnq5_Na3t3wY4iTSbEE3zTLCOqo=F+3thOnHqXdPgDZkso0kw@mail.gmail.com>
Subject: Re: [PATCH 04/40] drm/amd/amdgpu/amdgpu_drv: Move
 'amdgpu_info_ioctl()'s prototype to shared header
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgODo0OSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYzo0
ODY6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhhbWRncHVfaW5mb19p
b2N0bOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIDQ4NiB8IGludCBhbWRncHVfaW5mb19p
b2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUg
KmZpbHApCj4gIHwgXn5+fn5+fn5+fn5+fn5+fn4KPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4g
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpMdWJlbiBhbHJl
YWR5IHNlbnQgYSBwYXRjaCB0byBmaXggdGhpcyBvbmUuICBJJ2xsIGJlIHBpY2tpbmcgdXAgdGhh
dCBvbmUuCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMgfCAgNCArLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMu
YyB8ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5oIHwgMzEg
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmgKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMKPiBpbmRleCAxZGZlYTE1YmJlYzM2Li5hZmQzNTdkZjBmODg2IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+IEBAIC00Myw3ICs0Myw3IEBA
Cj4gICNpbmNsdWRlICJhbWRncHVfc2NoZWQuaCIKPgo+ICAjaW5jbHVkZSAiYW1kZ3B1X2FtZGtm
ZC5oIgo+IC0KPiArI2luY2x1ZGUgImFtZGdwdV9rbXMuaCIKPiAgI2luY2x1ZGUgImFtZGdwdV9y
YXMuaCIKPgo+ICAvKgo+IEBAIC0xNTIxLDggKzE1MjEsNiBAQCBpbnQgYW1kZ3B1X2ZpbGVfdG9f
ZnByaXYoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCBhbWRncHVfZnByaXYgKipmcHJpdikKPiAg
ICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAtaW50IGFtZGdwdV9pbmZvX2lvY3RsKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlscCk7Cj4gLQo+
ICBjb25zdCBzdHJ1Y3QgZHJtX2lvY3RsX2Rlc2MgYW1kZ3B1X2lvY3Rsc19rbXNbXSA9IHsKPiAg
ICAgICAgIERSTV9JT0NUTF9ERUZfRFJWKEFNREdQVV9HRU1fQ1JFQVRFLCBhbWRncHVfZ2VtX2Ny
ZWF0ZV9pb2N0bCwgRFJNX0FVVEh8RFJNX1JFTkRFUl9BTExPVyksCj4gICAgICAgICBEUk1fSU9D
VExfREVGX0RSVihBTURHUFVfQ1RYLCBhbWRncHVfY3R4X2lvY3RsLCBEUk1fQVVUSHxEUk1fUkVO
REVSX0FMTE9XKSwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jCj4gaW5k
ZXggOTg3MjFhZTkzMTg0MS4uNTRjNGVlNmQyMzBkOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfa21zLmMKPiBAQCAtNDEsNiArNDEsNyBAQAo+ICAjaW5jbHVkZSAiYW1k
Z3B1X2FtZGtmZC5oIgo+ICAjaW5jbHVkZSAiYW1kZ3B1X2dlbS5oIgo+ICAjaW5jbHVkZSAiYW1k
Z3B1X2Rpc3BsYXkuaCIKPiArI2luY2x1ZGUgImFtZGdwdV9rbXMuaCIKPiAgI2luY2x1ZGUgImFt
ZGdwdV9yYXMuaCIKPgo+ICB2b2lkIGFtZGdwdV91bnJlZ2lzdGVyX2dwdV9pbnN0YW5jZShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2ttcy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2ttcy5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwLi5mMzEx
MWFlZjc2Y2FlCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9rbXMuaAo+IEBAIC0wLDAgKzEsMzEgQEAKPiArLyogYW1kZ3B1X2ttcy5oIC0t
IFByaXZhdGUgaGVhZGVyIGZvciByYWRlb24gZHJpdmVyIC0qLSBsaW51eC1jIC0qLQo+ICsgKgo+
ICsgKiBDb3B5cmlnaHQgMjAwOCBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuCj4gKyAqIENv
cHlyaWdodCAyMDA4IFJlZCBIYXQgSW5jLgo+ICsgKiBDb3B5cmlnaHQgMjAwOSBKZXJvbWUgR2xp
c3NlLgo+ICsgKgo+ICsgKiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNo
YXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYQo+ICsgKiBjb3B5IG9mIHRoaXMgc29mdHdh
cmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLAo+
ICsgKiB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRp
bmcgd2l0aG91dCBsaW1pdGF0aW9uCj4gKyAqIHRoZSByaWdodHMgdG8gdXNlLCBjb3B5LCBtb2Rp
ZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLAo+ICsgKiBhbmQvb3Ig
c2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hv
bSB0aGUKPiArICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRo
ZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKPiArICoKPiArICogVGhlIGFib3ZlIGNvcHlyaWdodCBu
b3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4KPiAr
ICogYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCj4g
KyAqCj4gKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJB
TlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCj4gKyAqIElNUExJRUQsIElOQ0xVRElORyBCVVQg
Tk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAo+ICsgKiBG
SVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiAgSU4g
Tk8gRVZFTlQgU0hBTEwKPiArICogVEhFIENPUFlSSUdIVCBIT0xERVIoUykgT1IgQVVUSE9SKFMp
IEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SCj4gKyAqIE9USEVSIExJQUJJTElU
WSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLAo+
ICsgKiBBUklTSU5HIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRX
QVJFIE9SIFRIRSBVU0UgT1IKPiArICogT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgo+
ICsgKi8KPiArCj4gKyNpZm5kZWYgX19BTURHUFVfS01TX0hfXwo+ICsjZGVmaW5lIF9fQU1ER1BV
X0tNU19IX18KPiArCj4gK2ludCBhbWRncHVfaW5mb19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LCB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHApOwo+ICsKPiArI2VuZGlmICAg
ICAgICAgICAgICAgICAgICAgICAgIC8qIF9fQU1ER1BVX0tNU19IX18gKi8KPiAtLQo+IDIuMjUu
MQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
