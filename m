Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF0A51952
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 19:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A92589D5B;
	Mon, 24 Jun 2019 17:10:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C9289D5B
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 17:10:20 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w9so412975wmd.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 10:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=onR41oq3ehR+BptZU0syeep7qmpaEAEGTU/Bfr7hoyE=;
 b=Dz3ZKljJSVVCGE0Hfypu1ugXQFjMgK8y8UvdBQDBAhyEGm3yDqtsDTa2GjE7dp/KoE
 LQ8tZZuLfFaG7NDPa78zdskYAHvGdABse4HUyzlZ3bBUbL4AClzOkzTCylpvh5IYvmiX
 DuZUKd9LZRr9iLO4yvjmHEcUOdE3cZ5Tc86xrDSTKzU1k5R6q1U2XlGbfDF6peYKUrJM
 jeZZLWLn7CtLets9bMtbAPoY3EcMNy8xfnCHIJ929eIUhZJflaSHfKuPKiISo/DkPAId
 Qu2ZP1oRlRAz55gLbcXtsbdu3KcuywrtYDTytWYfNDWXHSRB3T3hDPXuxAJZ+0TMZbf/
 +yxQ==
X-Gm-Message-State: APjAAAVyk//9oW76PEBLVt8SxpmFzA494IAIQLui0AtK7LtJ1ViKYm4S
 vDo8edR5P7/CfDNUs8j/xjBf8gaL
X-Google-Smtp-Source: APXvYqwnF/I6EoY/bk/ogr6HEhfuqPj3BI2EFZ6gBpHblB7gZYF3Eqha3eVIqW2YjqjgW5yCl5lCEg==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr17879858wmc.154.1561396218793; 
 Mon, 24 Jun 2019 10:10:18 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id q10sm12145927wrf.32.2019.06.24.10.10.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 10:10:18 -0700 (PDT)
Subject: Re: [PATCH libdrm 0/2] amdgpu: Minor cleanups
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 amd-gfx@lists.freedesktop.org
References: <20190624154535.8619-1-michel@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9ad59243-1f61-4553-fb8a-5e749693e2b7@gmail.com>
Date: Mon, 24 Jun 2019 19:10:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190624154535.8619-1-michel@daenzer.net>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=onR41oq3ehR+BptZU0syeep7qmpaEAEGTU/Bfr7hoyE=;
 b=Z7Sdzn98pa9OPZQTuAd08YZZyAdCebw0F2NaB/4mBnyBQwEeBnVIBAMsQ7ZuUAzytv
 1hbDUx6SCqqmq6iwEXOwFW4fdEjXSakHuLQL8s0VdEYEZrUTrL6RNgzVkFmQx9W/l5f/
 zlBFZKpHHs8m182nN29GXZTNmr13U+C/S/7/RU9ZDL8ayb+a25+qllKgxJfubf99qKVs
 96dVFE11reEbtBG0c33LOvnvaEyGBRpwwKW+XfSfy8NXOWY9VH8cJqsjWdfzffDJZypA
 dstNUybGMIVKoxnUV3cph8KwNdCqBMtv/68vhuEUK5vbm4aS44bTIjsCqHoWgv59aZJv
 Mwrg==
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

UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4g
Zm9yIHRoZSBzZXJpZXMuCgpBbSAyNC4wNi4xOSB1bSAxNzo0NSBzY2hyaWViIE1pY2hlbCBEw6Ru
emVyOgo+IEZyb206IE1pY2hlbCBEw6RuemVyIDxtaWNoZWwuZGFlbnplckBhbWQuY29tPgo+Cj4g
SSBzdHVtYmxlZCBvdmVyIHRoZXNlIHdoaWxlIHdvcmtpbmcgb24gYmlnZ2VyIGNoYW5nZXMuCj4K
PiBNaWNoZWwgRMOkbnplciAoMik6Cj4gICAgYW1kZ3B1OiBNb3ZlIHVuaW9uIGRlY2xhcmF0aW9u
IHRvIHRvcCBvZgo+ICAgICAgYW1kZ3B1X2NzX2N0eF9vdmVycmlkZV9wcmlvcml0eQo+ICAgIGFt
ZGdwdTogVXBkYXRlIGFtZGdwdV9ib19oYW5kbGVfdHlwZV9rbXNfbm9pbXBvcnQgZG9jdW1lbnRh
dGlvbgo+Cj4gICBhbWRncHUvYW1kZ3B1LmggICAgfCA0ICsrLS0KPiAgIGFtZGdwdS9hbWRncHVf
Y3MuYyB8IDIgKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
