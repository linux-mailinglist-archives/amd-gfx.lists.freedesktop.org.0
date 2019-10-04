Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C4BCB4DC
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 09:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B136E05D;
	Fri,  4 Oct 2019 07:16:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048A56E05D
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 07:16:11 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v17so4656907wml.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 04 Oct 2019 00:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=OGrDJ+cj+rCr7kIQgv2Ruy6dlHvCQZwRGYb9azTADOk=;
 b=Qqh9XdTJxWDAzejt/StkHyngnDzHsPdq2nKJjWA6n/upL1HqMO8KeaDVO5af3O0N5e
 TyAJVKLlaPfFXCcR/iz56StIscTApJconP3Ncp9A5Tdb2ehyUxEiePbtKYoD+pXcyBbC
 QjqPhVXO5XgsWkIsPaW5ioA8lyFPtdXm1FEuRv8i75FSG7AlLycixBldhAQ5IBQ6R2/e
 +KRZIlZCsC64iQjU13RqbOI2NC8+cOOWq85s2k3q2L9M59FgxThFRbeoYVEqMppE2OAE
 zACxwSVHttqG3TWytrgOkXOpdmT20o+utgAUORLF7zRG8+gUAndn/r5sVu0yqQCbqxMs
 643Q==
X-Gm-Message-State: APjAAAV7hYP3iEbT+cX6bLo7NeFWNrVb8guCl4H0uR0GR82DlTvZUmNs
 ZT89SmiR3KZMu7wal+MUtjc=
X-Google-Smtp-Source: APXvYqxaAIwOdc6cDSran/v3z6EZ/EhIkpFmRPxsx0M/38SsV5NNpnxFmwa9DBUxUXCyQClcfXahfw==
X-Received: by 2002:a1c:2382:: with SMTP id j124mr371052wmj.154.1570173368603; 
 Fri, 04 Oct 2019 00:16:08 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 94sm9082082wrk.92.2019.10.04.00.16.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Oct 2019 00:16:08 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Use the ALIGN() macro
To: "Tuikov, Luben" <Luben.Tuikov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20191003233902.1982-1-luben.tuikov@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f4f4bdef-577a-7402-e467-7003be73687a@gmail.com>
Date: Fri, 4 Oct 2019 09:16:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003233902.1982-1-luben.tuikov@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=OGrDJ+cj+rCr7kIQgv2Ruy6dlHvCQZwRGYb9azTADOk=;
 b=Uc/upb21BGHYC9M25cCtU0PAhaJ0NNt6sHcDirl4WwyoORXqNgiOmTeJX0OCJNvuz0
 Rbqg42SB6G5h+4tH2c7G68w6bUwkj0V1/uSy13CcjOf7FrtCM0onaQScgaNZTM6fXr2W
 Vr7rm8+NEuVGK6BzDiPbq8lcha+3arOzLAKW7BlZ8qdY/+qB4vU5Vt22QtXKhSeBIoNP
 dfsCKbkm3g5eqWw3Wz9iC6zlVfPn1WYEanErDueQULxJS9GcAA7FuOjAg6NDdk/ql6VQ
 bOFh680AXRIZKnDCIQWMpZOV0QRT/Ebjb+Uv+uAz/nIjQtV+F1dbNsAhzbLAiRD817Jp
 eh/g==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDQuMTAuMTkgdW0gMDE6Mzkgc2NocmllYiBUdWlrb3YsIEx1YmVuOgo+IFVzZSB0aGUgQUxJ
R04oKSBtYWNybyB0byBzZXQgIm51bV9kdyIgdG8gYQo+IG11bHRpcGxlIG9mIDgsIGkuZS4gbG93
ZXIgMyBiaXRzIGNsZWFyZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMdWJlbiBUdWlrb3YgPGx1YmVu
LnR1aWtvdkBhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMgfCAxMSArKy0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdHRtLmMKPiBpbmRleCA2OGM1NDFlMTExODkuLjczYzYyOGJjNmE1YiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPiBAQCAtMTkyMywxMCArMTkyMyw3IEBA
IHN0YXRpYyBpbnQgYW1kZ3B1X21hcF9idWZmZXIoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
bywKPiAgIAkqYWRkciArPSAodTY0KXdpbmRvdyAqIEFNREdQVV9HVFRfTUFYX1RSQU5TRkVSX1NJ
WkUgKgo+ICAgCQlBTURHUFVfR1BVX1BBR0VfU0laRTsKPiAgIAo+IC0JbnVtX2R3ID0gYWRldi0+
bW1hbi5idWZmZXJfZnVuY3MtPmNvcHlfbnVtX2R3Owo+IC0Jd2hpbGUgKG51bV9kdyAmIDB4NykK
PiAtCQludW1fZHcrKzsKPiAtCj4gKwludW1fZHcgPSBBTElHTihhZGV2LT5tbWFuLmJ1ZmZlcl9m
dW5jcy0+Y29weV9udW1fZHcsIDgpOwo+ICAgCW51bV9ieXRlcyA9IG51bV9wYWdlcyAqIDg7Cj4g
ICAKPiAgIAlyID0gYW1kZ3B1X2pvYl9hbGxvY193aXRoX2liKGFkZXYsIG51bV9kdyAqIDQgKyBu
dW1fYnl0ZXMsICZqb2IpOwo+IEBAIC0xOTg2LDExICsxOTgzLDcgQEAgaW50IGFtZGdwdV9jb3B5
X2J1ZmZlcihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQ2NF90IHNyY19vZmZzZXQsCj4g
ICAKPiAgIAltYXhfYnl0ZXMgPSBhZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jcy0+Y29weV9tYXhfYnl0
ZXM7Cj4gICAJbnVtX2xvb3BzID0gRElWX1JPVU5EX1VQKGJ5dGVfY291bnQsIG1heF9ieXRlcyk7
Cj4gLQludW1fZHcgPSBudW1fbG9vcHMgKiBhZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jcy0+Y29weV9u
dW1fZHc7Cj4gLQo+IC0JLyogZm9yIElCIHBhZGRpbmcgKi8KPiAtCXdoaWxlIChudW1fZHcgJiAw
eDcpCj4gLQkJbnVtX2R3Kys7Cj4gKwludW1fZHcgPSBBTElHTihudW1fbG9vcHMgKiBhZGV2LT5t
bWFuLmJ1ZmZlcl9mdW5jcy0+Y29weV9udW1fZHcsIDgpOwo+ICAgCj4gICAJciA9IGFtZGdwdV9q
b2JfYWxsb2Nfd2l0aF9pYihhZGV2LCBudW1fZHcgKiA0LCAmam9iKTsKPiAgIAlpZiAocikKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
