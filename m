Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49FBB4127
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 21:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547AF6EA51;
	Mon, 16 Sep 2019 19:30:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B81A6EA51
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 19:30:03 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y135so740178wmc.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 12:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=HZlKPjhr8LsSEABR4LA7f7k++Nv5vEVD87/UTTo2boM=;
 b=J8SL+wzraAsGY5KA9KFSHASd/2NrXZxGsHCj3Ne/XvadvtBy4uGsJaUdY8cvS0KI37
 Dz7bH1T3lJ7W17OwNoGpB8vEwz7KlYEQ0axdGgGJYShM2CmAmIHkOtAM23bnVQy6R77j
 3R33vlNxo8TpxexE+/Nt43AcpKCgjejUDdY3uUU256K/Kf8A6mMTPTiuiUOGCh2VdHEb
 4wI9rhvL6W+HGoO/Sjjop0N67qSEjLw6zcWw90F4Wil2oTUq3mjVVUVFr5buq+X1njT/
 uA5wDWh6konnlCW7ME3xfUjYByLpJt2ffZPoh/Ls1JxMjHLRyIsE+KfRa7u5Ye0LCNbM
 UZQA==
X-Gm-Message-State: APjAAAWkBbMpZMWzEooKq1krpOFfY7mti82pHTFaBGeC0ulIGwxSrFcO
 pqogCGqbwTKJqE3TGHjOIKI=
X-Google-Smtp-Source: APXvYqypBRMIRju8FM/7NIJcwshNNWfbRWzbS3VO37GVfnpJM2zYwFlsediTVSVIQvDOeRizqoxgTg==
X-Received: by 2002:a1c:4485:: with SMTP id r127mr466817wma.59.1568662201705; 
 Mon, 16 Sep 2019 12:30:01 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id v64sm63840wmf.12.2019.09.16.12.29.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Sep 2019 12:30:01 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu: use PAGE_SHIFT rather than PAGE_SIZE to
 get the shift
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20190916184313.20567-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <586a5164-b120-d991-a0a8-cd89b38e3f7c@gmail.com>
Date: Mon, 16 Sep 2019 21:29:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916184313.20567-1-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=HZlKPjhr8LsSEABR4LA7f7k++Nv5vEVD87/UTTo2boM=;
 b=BZe39LBjeXzvgFEP0qTdCCGdXSrGkAXYH+A9vM2LQMJfP8F0c8wP+3HahctcsxQin4
 x2WEq4Oprc+Ao/fx1G1sJ4QRzfk5Gcc54wKIO7iTslPmF+0JbRy8HYuVqxwuenc+92L8
 hmNGe2jPOKB5bVJ/3PnU5Tb+SC1zRZqCHEkz9Wwo1ti7VznunofXUh9rVeOBbPTPQpmR
 BaIbpJETja+d9SyIEzf0z/XUgMbEUpy5xd5CoySQOku341uuvFlJYnAyzX1BGCfnwdkR
 DFO6+xfj89xxat4oi6YJ9Q8LkG8cO2DkoD7U2m3wmOsGCJ27deLAIasTGWhVADVS4Wpy
 12mA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTYuMDkuMTkgdW0gMjA6NDMgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gTG9va3MgbGlrZSBh
IGNvcHkgYW5kIHBhc3RlIHR5cG8uCj4KPiBGaXhlczogMGQ5YTgwMjEzODI5ICgiZHJtL2FtZGdw
dTogY2xlYW51cCBjcmVhdGluZyBCT3MgYXQgZml4ZWQgbG9jYXRpb24iKQo+IFNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KClJldmlld2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IGZvciB0aGUgc2Vy
aWVzLgoKU29ycnkgZm9yIHRoZSBub2lzZSwgSSBkb24ndCBoYXZlIGhhcmR3YXJlIHRvIGFjdHVh
bGx5IHRlc3QgdGhhdCA6KAoKQW5kIEJUVzogU2hvdWxkbid0IHRoaXMgYmUgQU1ER1BVX1BBR0Vf
U0laRS9TSElGVD8KClRoYW5rcywKQ2hyaXN0aWFuLgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yYXMuYwo+IGluZGV4IGJlNDk0MTk3NzhkYi4uZmYxZmMwODRmZmUxIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+IEBAIC0xNDA5LDcgKzE0MDksNyBA
QCBpbnQgYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKPiAgIAlmb3IgKGkgPSBkYXRhLT5sYXN0X3Jlc2VydmVkOyBpIDwgZGF0YS0+Y291bnQ7
IGkrKykgewo+ICAgCQlicCA9IGRhdGEtPmJwc1tpXS5yZXRpcmVkX3BhZ2U7Cj4gICAKPiAtCQlp
ZiAoYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoYWRldiwgYnAgPDwgUEFHRV9TSVpFLCBQQUdF
X1NJWkUsCj4gKwkJaWYgKGFtZGdwdV9ib19jcmVhdGVfa2VybmVsX2F0KGFkZXYsIGJwIDw8IFBB
R0VfU0hJRlQsIFBBR0VfU0laRSwKPiAgIAkJCQkJICAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZS
QU0sCj4gICAJCQkJCSAgICAgICAmYm8sIE5VTEwpKQo+ICAgCQkJRFJNX0VSUk9SKCJSQVMgRVJS
T1I6IHJlc2VydmUgdnJhbSAlbGx4IGZhaWxcbiIsIGJwKTsKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
