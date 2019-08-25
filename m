Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D629C548
	for <lists+amd-gfx@lfdr.de>; Sun, 25 Aug 2019 19:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161E36E10C;
	Sun, 25 Aug 2019 17:46:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41FE6E10C
 for <amd-gfx@lists.freedesktop.org>; Sun, 25 Aug 2019 17:46:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z1so13114563wru.13
 for <amd-gfx@lists.freedesktop.org>; Sun, 25 Aug 2019 10:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=0sEBsQ2CvXfQmhjh8W9Xc2OKt1ERVoiFVmTjphziEF8=;
 b=nRj1wrHRQDN6xglTY50bDU9hVMe7hCWnzjecI6uvKGx9B4xcXdvxPOzsbcklak86s0
 e+l5cWq1q6M9c/dRZpuk5bqhjWrbLOgNtNNrLraoSOMEi5SKj4uOLE/PE5LKEJ9dBZAf
 fTHGIGQw6+RNKtno/RNUfljvfzp5jbIjSvkZa0egmKO49vdogZGbFRGDtSoHMlUR+Q5Z
 1LfqQpfT4T7freX63KypC+NQjHBwbxtyun+7Xu7+BZTIRH6qleSoRuPJds7NG3Q5WM6K
 6Od/PmWaKGmv5ONCLLwUW/isFQe1nOe2V3VCg4DbLqB3AhjZfy5LwTGUrYSSItdkXoCt
 Xq9g==
X-Gm-Message-State: APjAAAXEZ58q7BHcqIOYuK1BfIs0ISFD+FJbgC2DSetPWfk92LqCBAbI
 7JIFs3kYViFUyO5qPsawTk83bVez
X-Google-Smtp-Source: APXvYqz+NcodULFmudZVXFoIKKH03jmH/nP9e9hpacArcNw81zvmi0kVn7CUdYCb9WSBeFyTojzaBw==
X-Received: by 2002:adf:ee4f:: with SMTP id w15mr17696144wro.337.1566755166096; 
 Sun, 25 Aug 2019 10:46:06 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id a26sm9206741wmg.45.2019.08.25.10.46.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 10:46:05 -0700 (PDT)
Subject: Re: [PATCH] Revert "drm/amdgpu: free up the first paging queue v2"
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 christian.koenig@amd.com, Gang Ba <gaba@amd.com>
References: <1566590496-27967-1-git-send-email-gaba@amd.com>
 <cc47da8a-ce82-3f17-dcf9-aa11484f53a2@gmail.com>
 <3dfac757-dce5-97d4-549d-97bb476ff9fa@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d1c9c9a9-6de9-a40c-da51-1c5a79bcb1f1@gmail.com>
Date: Sun, 25 Aug 2019 19:46:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3dfac757-dce5-97d4-549d-97bb476ff9fa@daenzer.net>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0sEBsQ2CvXfQmhjh8W9Xc2OKt1ERVoiFVmTjphziEF8=;
 b=M0BtKdiJqw5dQ7uJoWr39tSJTRY/lHcTsaq1OmTE2vnl5bOinP7CZWdEOaml3XhqhZ
 GJw+LtlkzwgRy2HpMnD0fRdhkYcSuwGfLmMtMuvCxLi7iwQ6VmqlilkQD5mHdSRy6Pft
 JGrtWRbiNJF/HXXGUxPAjgHAEA2Zd+Poq/YgbRM2dh9NtfK08xDKGDD44LmC8Wl3mgQ9
 j8V3U0AgXyO5vGi8VwAHv1RlbEIdJB4gYkvQQ7ec+sxtUK/0YTNQXbfkF3QttkKuc0Lr
 S6yxD6GEMI3n/vvQ0Hv8u6tiafUYR6hnU0QsYpWjA5YWs036PcliUExmZlAQChl/CwvX
 bY7A==
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
Cc: "Ba, Gang" <Gang.Ba@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjUuMDguMTkgdW0gMTc6Mjkgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPiBPbiAyMDE5LTA4
LTI0IDE6MTAgcC5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMjMuMDguMTkgdW0g
MjI6MDEgc2NocmllYiBHYW5nIEJhOgo+Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCA0ZjhiYzcyZmJm
MTBmMmRjOGJjYTc0ZDVkYTA4YjNhOTgxYjJlNWNkLgo+Pj4KPj4+IENoYW5nZS1JZDogSTU3N2Jh
MjM2ZTA1NzFkMTE0MDBhNTFmOWQ5NTg0MDIzNGFlZjY3OGEKPj4gTWlzc2luZyBTaWduZWQtb2Yt
YnkgbGluZSBoZXJlLiBXaXRoIHRoYXQgZml4ZWQgUmV2aWV3ZWQtYnk6IENocmlzdGlhbgo+PiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBFdmVyeSByZXZlcnQgbmVlZHMgdG8g
ZXhwbGFpbiBpbiB0aGUgY29tbWl0IGxvZyB3aHkgdGhlIGNvbW1pdCBpcyBiZWluZwo+IHJldmVy
dGVkLgoKU29tZXRoaW5nIGxpa2U6IEl0IHR1cm5lZCBvdXQgdGhhdCBhIHNpbmdsZSByZXNlcnZl
ZCBxdWV1ZSB3b3VsZG4ndCBiZSAKc3VmZmljaWVudCBmb3IgcGFnZSBmYXVsdCBoYW5kbGluZy4K
CkNocmlzdGlhbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
