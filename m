Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6459008B
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 13:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354296E313;
	Fri, 16 Aug 2019 11:12:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A476E313
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 11:12:12 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o4so3731394wmh.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 04:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=YXZrHDg1NwaAcrV3UVXkHFcuk/KHZLZxGQk0fzOwLyA=;
 b=lUoQUKNDIZnoz0LILLbQT9+n0UqtdPCOOWD1rfLxXRLYUF85Q4fCKDNX3yzcN01EDD
 Lx9vfj4YZcK+ak52DWjOezLlQPS2trUyA+XIEIiMIP0SM1+L4Nfc+bNzf/fi76xWid4w
 mVBCkY2fuTGL1L2ymvB0yUmO+/PlsgP4+RboEY2b9F0yEtKzu/MODApAIkwq2cc8wH+/
 ZP/lZPIbUpNfkfxz4YCTo3h4hZ42XsTYoTKgpWLvldwTSWzZyg2mL5hC5A1yaMNgxori
 T3GfTvK8z59L5D1xlKz5aVkV6OwumvsVW1Bndz61G/JDsDc2+yCW/lXR93E4oJqf3URr
 eb3g==
X-Gm-Message-State: APjAAAVV6O5+nlEYTT3rrC/LpFnjUUEekfdiigLQAgtI+6oWOEFQJ79y
 rOzSgCuKj4zkSe6Gc+FsuFg=
X-Google-Smtp-Source: APXvYqy1WTuOAFLjXSjiuvz3I2Kz1sFd/93jPdXmulLkpxouXleSKvE9K7B5Sjt7Qcnbbn7ZbB+OLA==
X-Received: by 2002:a1c:200a:: with SMTP id g10mr6413813wmg.160.1565953930593; 
 Fri, 16 Aug 2019 04:12:10 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x6sm5815415wrt.63.2019.08.16.04.12.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 04:12:10 -0700 (PDT)
Subject: Re: [PATCH libdrm] amdgpu: add mmhub ras inject unit test
To: Guchun Chen <guchun.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 Hawking.Zhang@amd.com, Dennis.Li@amd.com, flora.cui@amd.com,
 Tao.Zhou1@amd.com
References: <20190816110401.11069-1-guchun.chen@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b6cde318-e453-8a89-095c-69708f0981ef@gmail.com>
Date: Fri, 16 Aug 2019 13:12:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816110401.11069-1-guchun.chen@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YXZrHDg1NwaAcrV3UVXkHFcuk/KHZLZxGQk0fzOwLyA=;
 b=W/hss9Z6bNX9/cidZ4dLD90e3gYp09UCeGNHYbS5qPgLC9rqm0fVkeJ12N4HA4s303
 v2xH+N4WOWZjVcOmTZo+ACwhhKp/nrQTyZwLfm5rMYPT8I50Sn1Wd1EtHAbhoEWkcdBD
 GmThgGjAhAwQ5DO/z/rKHkDm/e3TPgYus9Ig4Tba6rVmX1JCA2cPiKVgMJ5VBl4vxGeH
 EZEedZieBe6ru3lAHRx+BEX2DMwaaBtWtxzeFU+obkmwk2+kcLyJIpW9iTeZkC4K1aJv
 nO8eJ8I+mBBNm2+G3IwYYBSYzQrxusUZYob80d1U1/K4dhl+Hiu9z6Uv3B4Qx8qFDsa6
 pGjA==
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
Cc: Candice.Li@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2VsbCB0aGlzIGRvZXNuJ3QgbG9vayBsaWtlIEMgdG8gbWUuIERpZCB3ZSBhZGRlZCBhIGNvbmZp
Z3VyYXRpb24gZmlsZSAKZm9yIHRoZSByYXMgdW5pdCB0ZXN0cyBvciBzb21ldGhpbmcgbGlrZSB0
aGF0PwoKQ2hyaXN0aWFuLgoKQW0gMTYuMDguMTkgdW0gMTM6MDQgc2NocmllYiBHdWNodW4gQ2hl
bjoKPiBDaGFuZ2UtSWQ6IElhNzZiOTUxNjJmNWY2ZjQxOWY3MGI1M2VmNDQzYmNlYWYyZTA5MmUw
Cj4gU2lnbmVkLW9mZi1ieTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVuQGFtZC5jb20+Cj4gLS0t
Cj4gICBkYXRhL2FtZGdwdV9yYXMuanNvbiB8IDEwICsrKysrKysrKysKPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZGF0YS9hbWRncHVfcmFzLmpz
b24gYi9kYXRhL2FtZGdwdV9yYXMuanNvbgo+IGluZGV4IDI2ZmQ5NDY1Li40ODRmMTJmMiAxMDA2
NDQKPiAtLS0gYS9kYXRhL2FtZGdwdV9yYXMuanNvbgo+ICsrKyBiL2RhdGEvYW1kZ3B1X3Jhcy5q
c29uCj4gQEAgLTEyMSw2ICsxMjEsOSBAQAo+ICAgICAgICAgICAgICAgICAgICJ1dGNfYXRjbDJf
Y2FjaGVfNGtfYmFuayI6IDExMQo+ICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICB9LAo+ICsg
ICAgICAgICJtbWh1YiI6IHsKPiArICAgICAgICAgICAgImluZGV4IjogMwo+ICsgICAgICAgIH0s
Cj4gICAgICAgfSwKPiAgICAgICAidHlwZSI6IHsKPiAgICAgICAgICAgInBhcml0eSI6IDEsCj4g
QEAgLTI2Myw1ICsyNjYsMTIgQEAKPiAgICAgICAgICAgICAgICJhZGRyZXNzIjogMCwKPiAgICAg
ICAgICAgICAgICJ2YWx1ZSI6IDAKPiAgICAgICAgICAgfSwKPiArICAgICAgICB7Cj4gKyAgICAg
ICAgICAgICJuYW1lIjogInJhc19tbWh1Yi4xLjAiLAo+ICsgICAgICAgICAgICAiYmxvY2siOiAi
bW1odWIiLAo+ICsgICAgICAgICAgICAidHlwZSI6ICJzaW5nbGVfY29ycmVjdGFibGUiLAo+ICsg
ICAgICAgICAgICAiYWRkcmVzcyI6IDAsCj4gKyAgICAgICAgICAgICJ2YWx1ZSI6IDAKPiArICAg
ICAgICB9LAo+ICAgICAgIF0KPiAgIH0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
