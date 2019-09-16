Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9F8B3669
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 10:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A456E14F;
	Mon, 16 Sep 2019 08:32:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB996E14F
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 08:32:13 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r5so3899708wrm.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 01:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DZ42Z0t0DUoSp78kOSWHJshSOzh8R6lfg03ZFNZD9ks=;
 b=WkasQZGSEMxIkaOVM35/hcyhztxUykzguppylR72IAj1KupJadej90kLvYYkOZKmlS
 MhQRBkt/0TqtyGo1QVA8tTs0o8T8bm3o9ABZ3vHhYiMQbTjtUToSVCJcrPQuETgljCwT
 +FOewd5WSaVwGEKLUw6q3I43BBnjBQ1DflP3d/l7nYzqWRfEkiD5rJSgJoqf3GRwid6E
 MgfWkyxLG/hqs5aAgVy0ND5y5tAWcaaTfy4W5UPis+bDtxmgjeJyQx1a6yjIesJPhs5x
 5Wy9Z/QlAEsX1I6NWa/8KvY9Gx1Pbm+QqwrE4LJb7m9zrUD5YpfpCoxbqGTq+keCBCTR
 OW+w==
X-Gm-Message-State: APjAAAX62gWCgKeqIg073LWBWIl6rNg4ozDsptoaHefu3qI2MgEog/KW
 ODfW1CYaYXoYon25HvZsMsA=
X-Google-Smtp-Source: APXvYqxmvWI9CYNidV+d4ljWH7XvdrZUCaM4fufTPTvvlcBeL+ulCEGtHqdhe3NtN/RgMUUpVd8bRw==
X-Received: by 2002:a05:6000:1632:: with SMTP id
 v18mr52557539wrb.61.1568622732336; 
 Mon, 16 Sep 2019 01:32:12 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id d193sm18228751wmd.0.2019.09.16.01.32.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Sep 2019 01:32:11 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix ras ctrl debugfs node leak
To: "Chen, Guchun" <Guchun.Chen@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>,
 "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
References: <20190916054655.26380-1-guchun.chen@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e1b69345-ac87-95ac-8433-20685ffd3822@gmail.com>
Date: Mon, 16 Sep 2019 10:32:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916054655.26380-1-guchun.chen@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=DZ42Z0t0DUoSp78kOSWHJshSOzh8R6lfg03ZFNZD9ks=;
 b=NeITrF6YPvnOgO/HXFNOLcRfmswlh4wDJLqO0olRj113LT4Sc5qKP7SXQK4SVZDJGb
 7BSCut8guijawJQCo6pUl+77QDROqoZbpmTIMpP0kDGWPf9a1D52C05MMFthYR9gpgGN
 VCKYVTBWE2zuEmHtIKcU/Ik3DBAG2wsRa4ewirxZEB8JbhbSR/7Pfqwg3oO3AInnVAIi
 MMaAsqtWc62kMPSjIqi08EsABUTaXC+qa1BEBwCFivEvtiHXx6MuJwlb5oaOB5WYEV5z
 fi82+BcCwRdafv7TPMYuG8O+PwCd7Hj0fGnzoMZXzo04voyRypMZ58Nn8MUzipVF2hQt
 b1Pw==
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

QW0gMTYuMDkuMTkgdW0gMDc6NDcgc2NocmllYiBDaGVuLCBHdWNodW46Cj4gVXNlIGRlYnVnZnNf
cmVtb3ZlX3JlY3Vyc2l2ZSB0byByZW1vdmUgdGhlIHdob2xlIGRlYnVnZnMKPiBkaXJlY3Rvcnkg
aW5zdGVhZCBvZiByZW1vdmluZyB0aGUgbm9kZSBvbmUgYnkgb25lLgo+Cj4gQ2hhbmdlLUlkOiBJ
MjdlOWVkYWIyMGQ1NjhiMTZkMDE2M2Y4YzdjM2Q4MWZiNjgzMmFjZAo+IFNpZ25lZC1vZmYtYnk6
IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCAxMiArKysrKy0tLS0tLS0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCB8ICAyIC0tCj4gICAyIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPiBpbmRleCA1ZjA2ZjFlNjQ1YzcuLjBhOTBlNWNiM2Nh
NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPiBAQCAtOTc4
LDEwICs5NzgsMTAgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2NyZWF0ZV9jdHJs
X25vZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAJc3RydWN0IGRybV9taW5vciAq
bWlub3IgPSBhZGV2LT5kZGV2LT5wcmltYXJ5Owo+ICAgCj4gICAJY29uLT5kaXIgPSBkZWJ1Z2Zz
X2NyZWF0ZV9kaXIoInJhcyIsIG1pbm9yLT5kZWJ1Z2ZzX3Jvb3QpOwo+IC0JY29uLT5lbnQgPSBk
ZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJyYXNfY3RybCIsIFNfSVdVR08gfCBTX0lSVUdPLCBjb24tPmRp
ciwKPiAtCQkJCSAgICAgICBhZGV2LCAmYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfb3BzKTsKPiAt
CWNvbi0+ZW50ID0gZGVidWdmc19jcmVhdGVfZmlsZSgicmFzX2VlcHJvbV9yZXNldCIsIFNfSVdV
R08gfCBTX0lSVUdPLCBjb24tPmRpciwKPiAtCQkJCQkgICAgICAgYWRldiwgJmFtZGdwdV9yYXNf
ZGVidWdmc19lZXByb21fb3BzKTsKPiArCWRlYnVnZnNfY3JlYXRlX2ZpbGUoInJhc19jdHJsIiwg
U19JV1VHTyB8IFNfSVJVR08sIGNvbi0+ZGlyLAo+ICsJCQkJYWRldiwgJmFtZGdwdV9yYXNfZGVi
dWdmc19jdHJsX29wcyk7Cj4gKwlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJyYXNfZWVwcm9tX3Jlc2V0
IiwgU19JV1VHTyB8IFNfSVJVR08sIGNvbi0+ZGlyLAo+ICsJCQkJYWRldiwgJmFtZGdwdV9yYXNf
ZGVidWdmc19lZXByb21fb3BzKTsKPiAgIH0KPiAgIAo+ICAgdm9pZCBhbWRncHVfcmFzX2RlYnVn
ZnNfY3JlYXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+IEBAIC0xMDI2LDEwICsxMDI2
LDggQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX3JlbW92ZV9hbGwoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAJCWFtZGdwdV9yYXNfZGVidWdmc19yZW1vdmUoYWRldiwg
Jm9iai0+aGVhZCk7Cj4gICAJfQo+ICAgCj4gLQlkZWJ1Z2ZzX3JlbW92ZShjb24tPmVudCk7Cj4g
LQlkZWJ1Z2ZzX3JlbW92ZShjb24tPmRpcik7Cj4gKwlkZWJ1Z2ZzX3JlbW92ZV9yZWN1cnNpdmUo
Y29uLT5kaXIpOwo+ICAgCWNvbi0+ZGlyID0gTlVMTDsKPiAtCWNvbi0+ZW50ID0gTlVMTDsKPiAg
IH0KPiAgIC8qIGRlYnVnZnMgZW5kICovCj4gICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Jhcy5oCj4gaW5kZXggZGQ1ZGEzYzYzMjdlLi5hZTM4NmM0NjZjMGUgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCj4gQEAgLTMxNyw4ICszMTcsNiBA
QCBzdHJ1Y3QgYW1kZ3B1X3JhcyB7Cj4gICAJc3RydWN0IGxpc3RfaGVhZCBoZWFkOwo+ICAgCS8q
IGRlYnVnZnMgKi8KPiAgIAlzdHJ1Y3QgZGVudHJ5ICpkaXI7Cj4gLQkvKiBkZWJ1Z2ZzIGN0cmwg
Ki8KPiAtCXN0cnVjdCBkZW50cnkgKmVudDsKPiAgIAkvKiBzeXNmcyAqLwo+ICAgCXN0cnVjdCBk
ZXZpY2VfYXR0cmlidXRlIGZlYXR1cmVzX2F0dHI7Cj4gICAJc3RydWN0IGJpbl9hdHRyaWJ1dGUg
YmFkcGFnZXNfYXR0cjsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
