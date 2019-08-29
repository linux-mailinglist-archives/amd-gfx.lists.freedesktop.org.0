Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DBCA125D
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 09:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6F889FBC;
	Thu, 29 Aug 2019 07:11:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157F289FBC
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 07:11:32 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k1so2509930wmi.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 00:11:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6SyOHyuOEH2vmRbLTbC/Qvuzp5/OTelIcjwI9rMOPqE=;
 b=YRFQt0+xd8YiKeA/0NO4goDSZL/YjN2iCQAqrBKINZHbWynzNLj+FQS7DO/CG0iKIV
 1t6LMYEz9BajhHEvpOenHrv5wePO+mqOGWARAkOFqUYmKlsoppI4ccfVEzV4nVFwPWiy
 mxCjcjM+/tgztXNWNU6xUFtZ26VJ72sOg5pCdPVOpWpy53PF0eIQtDcMg1PE0I6H8WMS
 19Z7R5Qb8kTYiO8LHw6tUaaetdllGQRSZeVm+I/rtS60zZaD4NeTCTADdfpwNa+OKC96
 UGNgOs13mn/62aWgfKIabWDUZMlU8MifOWvjCN2CMOgZQ8+22TNYMrVLxHpZr2AfZpPc
 98AA==
X-Gm-Message-State: APjAAAUZGXdkvLbGJXReRS9VtEsM695Va5tKHU18bdFYE81e2zBdy0Ya
 Ns6cLGtIdL1hwm9NArZ7gi8=
X-Google-Smtp-Source: APXvYqxxL7NvTpXrWTxWjF5CxT/WLVuASM2Uf8Fv3F2dFRsLZUCCUI/Nr7Edm9ZsNfiOERtRpiVGIA==
X-Received: by 2002:a05:600c:50a:: with SMTP id
 i10mr2278747wmc.114.1567062690609; 
 Thu, 29 Aug 2019 00:11:30 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w5sm2565909wrc.82.2019.08.29.00.11.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Aug 2019 00:11:30 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix gfx ib test failed in sriov
To: "Huang, JinHuiEric" <JinHuiEric.Huang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
References: <1567004342-10726-1-git-send-email-JinhuiEric.Huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <083833e2-aed1-c4e3-d348-0e54a0953d67@gmail.com>
Date: Thu, 29 Aug 2019 09:11:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567004342-10726-1-git-send-email-JinhuiEric.Huang@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=6SyOHyuOEH2vmRbLTbC/Qvuzp5/OTelIcjwI9rMOPqE=;
 b=mViqO367+0lMR8qXtk8cFnOwnSdGQzDvGeER0OhBF4iX055l9u5JerseWFS+t0/Owl
 UZn5I8aiuzaAAesnw2TmUtYvfOFxctwThKXiGsbU7wjZUQle+ASros5jDDiUc9osCI42
 CapUjV8KOKMgMln5AQXWQfYUmOvC5GV64n3QZNuWS+sooIpDPPrayo2V/ym1gG21p1H/
 25d4TlXt1i2nTlxPmR5rHmmtzSkHW4Lh5mzZPDSwsKQi8hib0TGH2GjKGa2wo4Wxodga
 Gw+rzOeCSiBj0skHAN1tjBO/XNaO7vSbMBQQvYWN0OyU0ICdbpzSITpGp7vdCIbMGyoS
 4ADg==
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

SGkgRXJpYywKCllpbiBoYXMgYWxyZWFkeSBwcm9wb3NlZCBwYXRjaGVzIGZvciBmaXhpbmcgdGhp
cyBhIGZldyBkYXlzIGFnby4gUGxlYXNlIApoZWxwIHRvIHJldmlldyB0aG9zZSBpbnN0ZWFkLgoK
VGhhbmtzLApDaHJpc3RpYW4KCkFtIDI4LjA4LjE5IHVtIDE2OjU5IHNjaHJpZWIgSHVhbmcsIEpp
bkh1aUVyaWM6Cj4gSXQgcGFydGlhbGx5IHJldmVydHMgdGhlIHJlZ3Jlc3Npb24gb2YKPgo+IGNv
bW1pdCBlNGE2N2U2Y2YxNGMyNTg2MTlmCj4gKCJkcm0vYW1kZ3B1L3BzcDogbW92ZSBUTVIgdG8g
Y3B1IGludmlzaWJsZSB2cmFtIHJlZ2lvbiIpCj4KPiB3aGljaCBjYXVzZXMgZ2Z4IGliIHRlc3Qg
ZmFpbGVkIHdoZW4gZHJpdmVyIGxvYWRpbmcKPiBpbiBzcmlvdiBzeXN0ZW0uCj4KPiBTaWduZWQt
b2ZmLWJ5OiBFcmljIEh1YW5nIDxKaW5odWlFcmljLkh1YW5nQGFtZC5jb20+Cj4gLS0tCj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgfCAxNiArKysrKysrKysrKyst
LS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmggfCAgMSArCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCj4gaW5kZXggOWY3Y2M1Yi4uOWY5
MWNlZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNw
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKPiBAQCAt
MjYxLDkgKzI2MSwxNCBAQCBzdGF0aWMgaW50IHBzcF90bXJfaW5pdChzdHJ1Y3QgcHNwX2NvbnRl
eHQgKnBzcCkKPiAgIAkJfQo+ICAgCX0KPiAgIAo+IC0JcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9r
ZXJuZWwocHNwLT5hZGV2LCB0bXJfc2l6ZSwgUFNQX1RNUl9TSVpFLAo+IC0JCQkJICAgICAgQU1E
R1BVX0dFTV9ET01BSU5fVlJBTSwKPiAtCQkJCSAgICAgICZwc3AtPnRtcl9ibywgJnBzcC0+dG1y
X21jX2FkZHIsIE5VTEwpOwo+ICsJaWYgKGFtZGdwdV9zcmlvdl92Zihwc3AtPmFkZXYpKQo+ICsJ
CXJldCA9IGFtZGdwdV9ib19jcmVhdGVfa2VybmVsKHBzcC0+YWRldiwgdG1yX3NpemUsIFBTUF9U
TVJfU0laRSwKPiArCQkJICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwKPiArCQkJICAgICAg
JnBzcC0+dG1yX2JvLCAmcHNwLT50bXJfbWNfYWRkciwgJnBzcC0+dG1yX2J1Zik7Cj4gKwllbHNl
Cj4gKwkJcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwocHNwLT5hZGV2LCB0bXJfc2l6ZSwg
UFNQX1RNUl9TSVpFLAo+ICsJCQkgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLAo+ICsJCQkg
ICAgICAmcHNwLT50bXJfYm8sICZwc3AtPnRtcl9tY19hZGRyLCBOVUxMKTsKPiAgIAo+ICAgCXJl
dHVybiByZXQ7Cj4gICB9Cj4gQEAgLTEyMTYsNyArMTIyMSwxMCBAQCBzdGF0aWMgaW50IHBzcF9o
d19maW5pKHZvaWQgKmhhbmRsZSkKPiAgIAo+ICAgCXBzcF9yaW5nX2Rlc3Ryb3kocHNwLCBQU1Bf
UklOR19UWVBFX19LTSk7Cj4gICAKPiAtCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmcHNwLT50bXJf
Ym8sICZwc3AtPnRtcl9tY19hZGRyLCBOVUxMKTsKPiArCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRl
dikpCj4gKwkJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZwc3AtPnRtcl9ibywgJnBzcC0+dG1yX21j
X2FkZHIsICZwc3AtPnRtcl9idWYpOwo+ICsJZWxzZQo+ICsJCWFtZGdwdV9ib19mcmVlX2tlcm5l
bCgmcHNwLT50bXJfYm8sICZwc3AtPnRtcl9tY19hZGRyLCBOVUxMKTsKPiAgIAlhbWRncHVfYm9f
ZnJlZV9rZXJuZWwoJnBzcC0+ZndfcHJpX2JvLAo+ICAgCQkJICAgICAgJnBzcC0+ZndfcHJpX21j
X2FkZHIsICZwc3AtPmZ3X3ByaV9idWYpOwo+ICAgCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmcHNw
LT5mZW5jZV9idWZfYm8sCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9wc3AuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaAo+
IGluZGV4IGJjMDk0N2YuLmI3M2Q0YWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3BzcC5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BzcC5oCj4gQEAgLTE3MSw2ICsxNzEsNyBAQCBzdHJ1Y3QgcHNwX2NvbnRleHQKPiAg
IAkvKiB0bXIgYnVmZmVyICovCj4gICAJc3RydWN0IGFtZGdwdV9ibwkJKnRtcl9ibzsKPiAgIAl1
aW50NjRfdAkJCXRtcl9tY19hZGRyOwo+ICsJdm9pZAkJCQkqdG1yX2J1ZjsKPiAgIAo+ICAgCS8q
IGFzZCBmaXJtd2FyZSBhbmQgYnVmZmVyICovCj4gICAJY29uc3Qgc3RydWN0IGZpcm13YXJlCQkq
YXNkX2Z3OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
