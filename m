Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DBC34CFD
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 18:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8646889A72;
	Tue,  4 Jun 2019 16:13:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A171A89A72
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 16:13:30 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f10so687387wmb.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Jun 2019 09:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZoTROJTPCdSh9zaOEY28RCL2hG5vxugoJfkvydbDp4E=;
 b=UbOJ3fvZt6xM0cUvCM0H6eo4211SeOLIB1WBQbPfaaidr0YDV7mQWKrQC0HQMPAUBV
 FLqZjlcNBtIH44K1hm/GqXGN62TWo0OvETOWvRP45LXKN0yhAg2AV6saEL1GAHr865JH
 vPZvpAUvrMrE606t2Gwb1RlllmqGEhkUDUDdLKJnG5V+wYTaUtyemcHdPv6+9J0Ejk8s
 IScJduGoY2PEI6LodiTICTv3lmf+5nsfYl2CyLmLRJVBNLeQJdup8btGs93Sz+Ch+ykV
 YjPi0roqlUB3uhsBVqCHdhqUvemEA5f4+uId5NWDXph1AdHTg+WtFjgosjl+SY92I2tZ
 JUlA==
X-Gm-Message-State: APjAAAVrtxEt2infFE+JBW2DKzfbyR6OgXgLm9vMITNv9M59hWSdkY39
 zaMrYXel69xNHvzworTU8Oqq2+zsNyIq3nkFMIw=
X-Google-Smtp-Source: APXvYqxoxlD1irIvboQwp1/OR/y74UOSPrm14kptlYLPD3GvVAwDUSELCV9s8MnsUu1CYS9nale9DtHYa9qV+O0+p5I=
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr111010wmk.67.1559664809184;
 Tue, 04 Jun 2019 09:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <1559664412-5512-1-git-send-email-shirish.s@amd.com>
In-Reply-To: <1559664412-5512-1-git-send-email-shirish.s@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 4 Jun 2019 12:13:16 -0400
Message-ID: <CADnq5_O2aB+5-tGSxo_ObqEGnCdgDEXyd99nnop6sDO2sKVVrw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/{uvd,vcn}: fetch ring's read_ptr after alloc
To: "S, Shirish" <Shirish.S@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ZoTROJTPCdSh9zaOEY28RCL2hG5vxugoJfkvydbDp4E=;
 b=g8MJUQH+u/MR5aHTg5pbx8XEYucZ+vPmJMFw3o1krnu2flol+B15I2JCrSKpond4Sx
 qXVvstUdMG0HMRljKuPiIfQivdwK/bgeXIebjDrXRE6LwuArqFgB11uR1TKXvekEGS75
 YHaLroEZjg71Dg4h9jIYwo2oNIdYv1TmnzX9V27t0tP03qiZAbCc9zRPRGNHuSggRwQA
 zY5lmfs2RmaZjQg6X/2SLo6RcI5Qgg+tbNWmcHunA97kQPHPgkEk7/ZPMklxsY2t2Zg4
 yzprr9V50NAbtKFIU5dDHt0FSAMI1MBBH/LjRxRrtTkm/f4NtWfKRA1pjBPEeVuJXAlE
 UEiQ==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deng,
 Emily" <Emily.Deng@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Liu, Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Li, Ching-shih \(Louis\)" <Ching-shih.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gNCwgMjAxOSBhdCAxMjowNyBQTSBTLCBTaGlyaXNoIDxTaGlyaXNoLlNAYW1k
LmNvbT4gd3JvdGU6Cj4KPiBbV2hhdF0KPiByZWFkcHRyIHJlYWQgYWx3YXlzIHJldHVybnMgemVy
bywgc2luY2UgbW9zdCBsaWtlbHkKPiBVVkQgYmxvY2sgaXMgZWl0aGVyIHBvd2VyIG9yIGNsb2Nr
IGdhdGVkLgo+Cj4gW0hvd10KPiBmZXRjaCBycHRyIGFmdGVyIGFtZGdwdV9yaW5nX2FsbG9jKCkg
d2hpY2ggaW5mb3Jtcwo+IHRoZSBwb3dlciBtYW5hZ2VtZW50IGNvZGUgdGhhdCB0aGUgYmxvY2sg
aXMgYWJvdXQgdG8gYmUKPiB1c2VkIGFuZCBoZW5jZSB0aGUgZ2F0aW5nIGlzIHR1cm5lZCBvZmYu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBMb3VpcyBMaSA8Q2hpbmctc2hpaC5MaUBhbWQuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IFNoaXJpc2ggUyA8c2hpcmlzaC5zQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyB8IDQgKysrLQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jICAgfCA1ICsrKystCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3V2ZF92N18wLmMgICB8IDUgKysrKy0KCldoYXQgYWJvdXQgdXZkIDQuMiwg
NS4wIGFuZCBWQ0UgMi4wLCAzLjAsIDQuMD8KCkFsZXgKCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTEg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdmNuLmMKPiBpbmRleCAxMTg0NTFmLi5kNzg2MDk4IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwo+IEBAIC00NjgsNyArNDY4LDcgQEAgaW50IGFt
ZGdwdV92Y25fZGVjX3JpbmdfdGVzdF9pYihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIGxvbmcg
dGltZW91dCkKPiAgaW50IGFtZGdwdV92Y25fZW5jX3JpbmdfdGVzdF9yaW5nKHN0cnVjdCBhbWRn
cHVfcmluZyAqcmluZykKPiAgewo+ICAgICAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYg
PSByaW5nLT5hZGV2Owo+IC0gICAgICAgdWludDMyX3QgcnB0ciA9IGFtZGdwdV9yaW5nX2dldF9y
cHRyKHJpbmcpOwo+ICsgICAgICAgdWludDMyX3QgcnB0cjsKPiAgICAgICAgIHVuc2lnbmVkIGk7
Cj4gICAgICAgICBpbnQgcjsKPgo+IEBAIC00NzYsNiArNDc2LDggQEAgaW50IGFtZGdwdV92Y25f
ZW5jX3JpbmdfdGVzdF9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKPiAgICAgICAgIGlm
IChyKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcjsKPgo+ICsgICAgICAgcnB0ciA9IGFtZGdw
dV9yaW5nX2dldF9ycHRyKHJpbmcpOwo+ICsKPiAgICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJp
bmcsIFZDTl9FTkNfQ01EX0VORCk7Cj4gICAgICAgICBhbWRncHVfcmluZ19jb21taXQocmluZyk7
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMKPiBpbmRleCBjNjFhMzE0Li4x
NjY4MmI3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8w
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jCj4gQEAgLTE3
MCwxMyArMTcwLDE2IEBAIHN0YXRpYyB2b2lkIHV2ZF92Nl8wX2VuY19yaW5nX3NldF93cHRyKHN0
cnVjdCBhbWRncHVfcmluZyAqcmluZykKPiAgc3RhdGljIGludCB1dmRfdjZfMF9lbmNfcmluZ190
ZXN0X3Jpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiA9IHJpbmctPmFkZXY7Cj4gLSAgICAgICB1aW50MzJfdCBycHRy
ID0gYW1kZ3B1X3JpbmdfZ2V0X3JwdHIocmluZyk7Cj4gKyAgICAgICB1aW50MzJfdCBycHRyOwo+
ICAgICAgICAgdW5zaWduZWQgaTsKPiAgICAgICAgIGludCByOwo+Cj4gICAgICAgICByID0gYW1k
Z3B1X3JpbmdfYWxsb2MocmluZywgMTYpOwo+ICAgICAgICAgaWYgKHIpCj4gICAgICAgICAgICAg
ICAgIHJldHVybiByOwo+ICsKPiArICAgICAgIHJwdHIgPSBhbWRncHVfcmluZ19nZXRfcnB0cihy
aW5nKTsKPiArCj4gICAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCBIRVZDX0VOQ19DTURf
RU5EKTsKPiAgICAgICAgIGFtZGdwdV9yaW5nX2NvbW1pdChyaW5nKTsKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvdXZkX3Y3XzAuYwo+IGluZGV4IGNkYjk2ZDQuLjc0ODExYjIgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92N18wLmMKPiBAQCAtMTc1LDcgKzE3NSw3IEBAIHN0
YXRpYyB2b2lkIHV2ZF92N18wX2VuY19yaW5nX3NldF93cHRyKHN0cnVjdCBhbWRncHVfcmluZyAq
cmluZykKPiAgc3RhdGljIGludCB1dmRfdjdfMF9lbmNfcmluZ190ZXN0X3Jpbmcoc3RydWN0IGFt
ZGdwdV9yaW5nICpyaW5nKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diA9IHJpbmctPmFkZXY7Cj4gLSAgICAgICB1aW50MzJfdCBycHRyID0gYW1kZ3B1X3JpbmdfZ2V0
X3JwdHIocmluZyk7Cj4gKyAgICAgICB1aW50MzJfdCBycHRyOwo+ICAgICAgICAgdW5zaWduZWQg
aTsKPiAgICAgICAgIGludCByOwo+Cj4gQEAgLTE4NSw2ICsxODUsOSBAQCBzdGF0aWMgaW50IHV2
ZF92N18wX2VuY19yaW5nX3Rlc3RfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCj4gICAg
ICAgICByID0gYW1kZ3B1X3JpbmdfYWxsb2MocmluZywgMTYpOwo+ICAgICAgICAgaWYgKHIpCj4g
ICAgICAgICAgICAgICAgIHJldHVybiByOwo+ICsKPiArICAgICAgIHJwdHIgPSBhbWRncHVfcmlu
Z19nZXRfcnB0cihyaW5nKTsKPiArCj4gICAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCBI
RVZDX0VOQ19DTURfRU5EKTsKPiAgICAgICAgIGFtZGdwdV9yaW5nX2NvbW1pdChyaW5nKTsKPgo+
IC0tCj4gMi43LjQKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
