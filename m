Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D37E2F3C26
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Jan 2021 23:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6C88997A;
	Tue, 12 Jan 2021 22:13:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761908997A;
 Tue, 12 Jan 2021 22:13:18 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id q25so3844817otn.10;
 Tue, 12 Jan 2021 14:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2rlldwJer3sr2AnmP99UBbkreO3bRQYA52H6Sx5kmiQ=;
 b=IyYfQtmGxqdwLuMw2jLptl7CZpr7L69oOQEeG0T1MRClpcYEGo4XkG8Z86Vxi8Tba9
 6A6BuP+5rXqtahnJpxjHcwlYXslQPmBrPOWyOg2oH9bt6JDygS7LMMP8LUAtFEIMMeBU
 8ewVNWLaVVpDOe5uTcqfI8llnZovv++pdUe/7kaQvt/zHWxFXaGX8/TVCn051Ko/9wF0
 yCRXU4OYF7tCfJKY6vGQrKqTXZbMGiXiyZsdPqq43b7cd3ipLgMN6OFknANxC9UrnMMR
 yXVQnFKMgJsMjk/Srd2Z4yTD5a6HPCrVW9UFqgq1RsEbf/chzCdEtgB40M2lJxq1ECVr
 4cFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2rlldwJer3sr2AnmP99UBbkreO3bRQYA52H6Sx5kmiQ=;
 b=Vr8mYAd6fWl5kGtyFuxACEy6QrWidLybBAQ1GpAg0s4eR/WD/T0coP87/smYihxUoR
 1DwglmByLhblBm+CFHoaoMsCv+E6HJ6nn6yFNJglHiG8yVAqF4/y7IMDx3JPEAhN6WAd
 mFoi8oX7jysuL8zWZ7/9TNNpfUGOKuR65G4MEfDfQlO77muZRUOzM6iMOTHztJDEvmug
 2Qk9nJmr4Ba/sByuFQJusVYwDhjXLjLpsNYPWXltGDUWnRB1SLV0Gfg/bI9vK9ZasX4i
 JJynTQ3HNB1gagW15VQRrbTIKK4LEV4sxtAA09kBwhN4pgBKKUfmzNEFep8yhqns7by1
 Xt9A==
X-Gm-Message-State: AOAM533z2WRDNuvnMW4ELTN5a5bIy3yYRbux6/uzkxhBj89dfAiyE1A1
 JCgFGhrH3hZyfIuZ67JXaBr1fy8j5DWc2r4jvlU=
X-Google-Smtp-Source: ABdhPJxwfq2AxQIrtSkizdx8vM1pySI4RPQBKMgb6X6OWJ2O+MeEEmN6azW2gwZoxFByGqvNbOtEHgev/eUuuAvpuT4=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr1096229ote.132.1610489597818; 
 Tue, 12 Jan 2021 14:13:17 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-13-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-13-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:13:04 -0500
Message-ID: <CADnq5_M27hzKp0tOqqNq-RHhRo_0KdjGt8V0dP7EdMKFidgvFA@mail.gmail.com>
Subject: Re: [PATCH 12/40] drm/amd/display/dc/dce120/Makefile: Ignore
 -Woverride-init warning
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMjoyMCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IFRoaXMgZmlsZSB1c2VzIGEgY29tcGxleCBhYnN0cmFjdGVkIHNl
dCBvZiBoaWVyYXJjaGljYWwgbWFjcm9zIHRvCj4gc2V0dXAgaXRzIGFwcGxpY2FibGUgcmVnaXN0
ZXIgbGlzdHMgd2l0aGluIGNvbnN0YW50IHN0cnVjdHVyZXMuCj4gSG93ZXZlciBpbiB0aGUgY2Fz
ZSBvZiBUTURTX0NOVEwgd2Ugd2lzaCB0byBtYXJrIGl0IGFzIG5vdCBhcHBsaWNhYmxlCj4gZm9y
IHRoaXMgdXNlLWNhc2UuCj4KPiBPbmUgbWV0aG9kIHdvdWxkIGJlIHRvIGRlLWNvbnN0IGFsbCBv
ZiB0aGUgZGVmaW5pdGlvbnMgYW5kIHVzZXJzLCB0aGVuCj4gbWFudWFsbHkgemVybyBvdXQgVE1E
U19DTlRMIGZyb20gdGhlIGxpc3QuICBBbm90aGVyIHdvdWxkIGJlIHRvIGNyZWF0ZQo+IGEgbmV3
IHNldCBvZiBoaWVyYXJjaGljYWwgbWFjcm9zIHRvIG9taXQgVE1EU19DTlRMIGVudGlyZWx5LiAg
Qm90aAo+IHdvdWxkIGVudGFpbCBhIGdyZWF0IGRlYWwgb2YgdW5uZWNlc3NhcnkgY2hhbmdlcyBh
bmQgbWFpbnRlbmFuY2UKPiBidXJkZW4uCj4KPiBJbnN0ZWFkLCBsZXQncyBqdXN0IHNpbGVuY2Ug
dGhlIHdhcm5pbmcuCj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2Fy
bmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2Rj
ZTEyMC9kY2UxMjBfcmVzb3VyY2UuYzoyNzc6MTU6IHdhcm5pbmc6IGluaXRpYWxpemVkIGZpZWxk
IG92ZXJ3cml0dGVuIFstV292ZXJyaWRlLWluaXRdCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jOjI4MToyOiBub3RlOiBp
biBleHBhbnNpb24gb2YgbWFjcm8g4oCYc3RyZWFtX2VuY19yZWdz4oCZCj4gIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jOjI3
NzoxNTogbm90ZTogKG5lYXIgaW5pdGlhbGl6YXRpb24gZm9yIOKAmHN0cmVhbV9lbmNfcmVnc1sw
XS5UTURTX0NOVEzigJkpCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkv
ZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jOjI4MToyOiBub3RlOiBpbiBleHBhbnNpb24gb2Yg
bWFjcm8g4oCYc3RyZWFtX2VuY19yZWdz4oCZCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jOjI3NzoxNTogd2FybmluZzog
aW5pdGlhbGl6ZWQgZmllbGQgb3ZlcndyaXR0ZW4gWy1Xb3ZlcnJpZGUtaW5pdF0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNl
LmM6MjgyOjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhzdHJlYW1fZW5jX3JlZ3Pi
gJkKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMjAvZGNl
MTIwX3Jlc291cmNlLmM6Mjc3OjE1OiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3Ig4oCY
c3RyZWFtX2VuY19yZWdzWzFdLlRNRFNfQ05UTOKAmSkKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmM6MjgyOjI6IG5vdGU6
IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhzdHJlYW1fZW5jX3JlZ3PigJkKPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmM6
Mjc3OjE1OiB3YXJuaW5nOiBpbml0aWFsaXplZCBmaWVsZCBvdmVyd3JpdHRlbiBbLVdvdmVycmlk
ZS1pbml0XQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEy
MC9kY2UxMjBfcmVzb3VyY2UuYzoyODM6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKA
mHN0cmVhbV9lbmNfcmVnc+KAmQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNw
bGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYzoyNzc6MTU6IG5vdGU6IChuZWFyIGluaXRp
YWxpemF0aW9uIGZvciDigJhzdHJlYW1fZW5jX3JlZ3NbMl0uVE1EU19DTlRM4oCZKQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3Vy
Y2UuYzoyODM6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmHN0cmVhbV9lbmNfcmVn
c+KAmQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEyMC9k
Y2UxMjBfcmVzb3VyY2UuYzoyNzc6MTU6IHdhcm5pbmc6IGluaXRpYWxpemVkIGZpZWxkIG92ZXJ3
cml0dGVuIFstV292ZXJyaWRlLWluaXRdCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jOjI4NDoyOiBub3RlOiBpbiBleHBh
bnNpb24gb2YgbWFjcm8g4oCYc3RyZWFtX2VuY19yZWdz4oCZCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jOjI3NzoxNTog
bm90ZTogKG5lYXIgaW5pdGlhbGl6YXRpb24gZm9yIOKAmHN0cmVhbV9lbmNfcmVnc1szXS5UTURT
X0NOVEzigJkpCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNl
MTIwL2RjZTEyMF9yZXNvdXJjZS5jOjI4NDoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g
4oCYc3RyZWFtX2VuY19yZWdz4oCZCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rp
c3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jOjI3NzoxNTogd2FybmluZzogaW5pdGlh
bGl6ZWQgZmllbGQgb3ZlcndyaXR0ZW4gWy1Xb3ZlcnJpZGUtaW5pdF0KPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmM6Mjg1
OjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhzdHJlYW1fZW5jX3JlZ3PigJkKPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jl
c291cmNlLmM6Mjc3OjE1OiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3Ig4oCYc3RyZWFt
X2VuY19yZWdzWzRdLlRNRFNfQ05UTOKAmSkKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Li4vZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmM6Mjg1OjI6IG5vdGU6IGluIGV4
cGFuc2lvbiBvZiBtYWNybyDigJhzdHJlYW1fZW5jX3JlZ3PigJkKPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmM6Mjc3OjE1
OiB3YXJuaW5nOiBpbml0aWFsaXplZCBmaWVsZCBvdmVyd3JpdHRlbiBbLVdvdmVycmlkZS1pbml0
XQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEyMC9kY2Ux
MjBfcmVzb3VyY2UuYzoyODY6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmHN0cmVh
bV9lbmNfcmVnc+KAmQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2Rj
L2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYzoyNzc6MTU6IG5vdGU6IChuZWFyIGluaXRpYWxpemF0
aW9uIGZvciDigJhzdHJlYW1fZW5jX3JlZ3NbNV0uVE1EU19DTlRM4oCZKQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYzoy
ODY6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmHN0cmVhbV9lbmNfcmVnc+KAmQo+
Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+IENjOiBMZW8g
TGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2Zm
LWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEK
CkFsZXgKCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL01h
a2VmaWxlIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9NYWtlZmlsZSBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvTWFrZWZpbGUKPiBpbmRleCAz
N2RiMWY4ZDQ1ZWE1Li5hOWNjNGI3MzI3MGJiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNlMTIwL01ha2VmaWxlCj4gQEAgLTI0LDYgKzI0LDggQEAKPiAgIyBJ
dCBwcm92aWRlcyB0aGUgY29udHJvbCBhbmQgc3RhdHVzIG9mIEhXIENSVEMgYmxvY2suCj4KPgo+
ICtDRkxBR1NfJChBTUREQUxQQVRIKS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLm8gPSAkKGNh
bGwgY2MtZGlzYWJsZS13YXJuaW5nLCBvdmVycmlkZS1pbml0KQo+ICsKPiAgRENFMTIwID0gZGNl
MTIwX3Jlc291cmNlLm8gZGNlMTIwX3RpbWluZ19nZW5lcmF0b3IubyBcCj4gIGRjZTEyMF9od19z
ZXF1ZW5jZXIubwo+Cj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngK
