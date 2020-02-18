Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0511B1624CD
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Feb 2020 11:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EB86E1B6;
	Tue, 18 Feb 2020 10:43:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE826E1B6
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Feb 2020 10:43:45 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k11so23270868wrd.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Feb 2020 02:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=O2PgF9MU+iATNalz9sA9Lsgw82CdDUqAMjGEhHmpQrU=;
 b=qDEVOmOBzb6jirH9TZe3vTF/0B5yK3agKtaS14sMW2hTfXyPD+ITKXauBwHrDSn/D1
 BFvzfY4D04k5A7j0zejHe5C6zwu4Od1eoD+VZBORqgR+eBJqZmqztfqXEU9snc6sCTC3
 jfRzDANUpZRtPLxLI3WHvi4QOMm9Anei5AT+hTw5aQDH9yVCbrvxafWWVWxePfeQm/tq
 m3gdarPVJKOaSPtXvU8BljDnBDAO8/BuxDz932lL1/pK8jIKG3V3iXaobWLJ7Fh892kN
 +FjWptxs38TOgNZagJ6o07MuzDUc1w5hfXtuQVuScQXNR2Ej8R+sYZGFWwv4XBbvZTx7
 HQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=O2PgF9MU+iATNalz9sA9Lsgw82CdDUqAMjGEhHmpQrU=;
 b=NbnJ4tCKfkFK0r1Vpx786UbZ8EFFOeLmob2Y+k2n2JmvJlBh8rErVEvuFeGZDbSSz/
 bIy72JxkzzAUxVs1Y7ri+Ri4OecIUlrObGfax3dYOPiG5rzuzciFsupZy3oXxkuHMTsn
 DiVkZmRjMMuSzc0ty3E3jaUy5o1UYN6bbf3+/pGm7CFxjDqk1X2Qg5g4W45JXrpoompJ
 kfJXX1WxsQ5KkgRIahuApSFsGCpgMVhnUliVnTQHot3Dgs5MouYGXQTGAJJBPhFmLP70
 Ie7Oh6M//UgmGH4BJtGSWS7yFOEEKZRPtDwmCGcDYhNIBDA3UAgycJHrQSjU+GU9VCU9
 fl7w==
X-Gm-Message-State: APjAAAXWLFFSNNIs0TmrBgWt7zEf/UnlLLTPvnXD5Qbhx4PFHP7nNj0h
 I8/1UVYTseb50FjoYKjBhPM7J+z0
X-Google-Smtp-Source: APXvYqzl5akRymRvljW6ETt9by75fTQvxnVVV17zJNQTW9SP1QJ9F0UQ3Nngrn33kTlnAXo4KyAO7g==
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr28280171wrs.395.1582022623649; 
 Tue, 18 Feb 2020 02:43:43 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id z8sm5133620wrq.22.2020.02.18.02.43.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Feb 2020 02:43:43 -0800 (PST)
Subject: Re: [PATCH v3] drm/amdgpu: fix the wrong logic checking when secure
 buffer is created (v3)
To: Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org
References: <1582022394-17454-1-git-send-email-ray.huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b929c59e-7100-276c-5e86-ab5371376aff@gmail.com>
Date: Tue, 18 Feb 2020 11:43:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1582022394-17454-1-git-send-email-ray.huang@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Aaron Liu <aaron.liu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTguMDIuMjAgdW0gMTE6Mzkgc2NocmllYiBIdWFuZyBSdWk6Cj4gV2hpbGUgdGhlIGN1cnJl
bnQgYW1kZ3B1IGRvZXNuJ3Qgc3VwcG9ydCBUTVosIGl0IHdpbGwgcmV0dXJuIHRoZSBlcnJvciBp
ZiB1c2VyCj4gbW9kZSB3b3VsZCBsaWtlIHRvIGFsbG9jYXRlIHNlY3VyZSBidWZmZXIuCj4KPiBG
aXhlczogMTdkOTA3YyBkcm0vYW1kZ3B1OiBpbXBsZW1lbnQgVE1aIGFjY2Vzc29yICh2MykKPgo+
IHYyOiB3ZSBkaWRuJ3QgbmVlZCB0aGlzIGNoZWNraW5nIGFueW1vcmUuCj4gdjM6IG9ubHkgcHJp
bnQgbWVzc2FnZSBvbmNlIHRpbWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5o
dWFuZ0BhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZ2VtLmMgfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCj4g
aW5kZXggYjUxYTA2MC4uNWJlYzY2ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZ2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZ2VtLmMKPiBAQCAtMjM1LDggKzIzNSw4IEBAIGludCBhbWRncHVfZ2VtX2NyZWF0ZV9p
b2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ICAgCWlmIChhcmdzLT5p
bi5kb21haW5zICYgfkFNREdQVV9HRU1fRE9NQUlOX01BU0spCj4gICAJCXJldHVybiAtRUlOVkFM
Owo+ICAgCj4gLQlpZiAoYW1kZ3B1X2lzX3RteihhZGV2KSAmJiAoZmxhZ3MgJiBBTURHUFVfR0VN
X0NSRUFURV9FTkNSWVBURUQpKSB7Cj4gLQkJRFJNX0VSUk9SKCJDYW5ub3QgYWxsb2NhdGUgc2Vj
dXJlIGJ1ZmZlciBzaW5jZSBUTVogaXMgZGlzYWJsZWRcbiIpOwo+ICsJaWYgKCFhbWRncHVfaXNf
dG16KGFkZXYpICYmIChmbGFncyAmIEFNREdQVV9HRU1fQ1JFQVRFX0VOQ1JZUFRFRCkpIHsKPiAr
CQlEUk1fTk9URV9PTkNFKCJDYW5ub3QgYWxsb2NhdGUgc2VjdXJlIGJ1ZmZlciBzaW5jZSBUTVog
aXMgZGlzYWJsZWRcbiIpOwo+ICAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgIAl9Cj4gICAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
