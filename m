Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD81E41E87
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 10:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311F68908E;
	Wed, 12 Jun 2019 08:03:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086DE8908E
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 08:03:17 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 22so5469904wmg.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 01:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=WprYgk88bNp7PJs/ofkWA2s3/qknck0Mj2TfRKsBkBk=;
 b=LLSwqU9YGNBuhbttChEHXWdYznd40vaOrUWg/09W/Mm1RQjM3HwbN00jrFVpfq7ib7
 hsGx4Y4cpVeVtcDqzALhEnfmoFRMjHoQNo0BHTpgmERfqTzNxeGd01cGaDNZm3JaxuOJ
 dSWnxvd6qZKaD8wNKGd9g/XiB+YQzaWhnNVyDkZ2lZsqGOQN99ev5SzIELYBPwKypDw+
 vXO+jSknjKsW4HERulHG4c1KC1JRbQ2osj0joJZ87qfIe9r+gy+WfhCXxiTHd6/RWTQg
 gjGEYjoapfFz24uNjXuy9q3Cjp58UZVGOocXHWWOBlnhEmfdftEqZSZdkY9rbMlxdnfs
 09lA==
X-Gm-Message-State: APjAAAV52vBAgy/OmHEvc/7lIug1B0Ti7r1TAyDdUzIhUVA0YRXSpyzk
 bEzASYcybiLch0qAS/HWZJ+IuxG0
X-Google-Smtp-Source: APXvYqxzug8LOuuPul7vTPvtYvweA+Ks/sX1UGdXlrNJ4MY3nP3t0mId02vBz5W7hbfbX0lVuSOS1g==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr22205028wmi.0.1560326595520; 
 Wed, 12 Jun 2019 01:03:15 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id v15sm17422153wrt.25.2019.06.12.01.03.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 01:03:15 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/amdgpu: Bail out of BO node creation if not
 enough VRAM (v2)
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 "StDenis, Tom" <Tom.StDenis@amd.com>
References: <20190611165444.17841-1-tom.stdenis@amd.com>
 <fd4c5152-2670-8ac5-e6cc-fff6f260f3ed@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <80760492-7d0a-25a2-1410-3a72e2a64ce9@gmail.com>
Date: Wed, 12 Jun 2019 10:03:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <fd4c5152-2670-8ac5-e6cc-fff6f260f3ed@daenzer.net>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=WprYgk88bNp7PJs/ofkWA2s3/qknck0Mj2TfRKsBkBk=;
 b=O7a7/O3jMZjS8Dlxbmas6aagZG/l7F5rHqLhAPTtaQKGYEut7+Z+azwgjGsZMEdwvY
 17wDvyUYgbnk2SgGuUzLH9rIUPK7c0wxRwkSdaZBJGNt/ambU3UHg0/mB/0BYHCCdQdq
 UpKs4QLzV8kOJHCeM5t3Go/nFBKob0b3HU2HQfqB+c021wWei25Mhty3Kb7FjAtiowF7
 K1DuCVS73mDmKnfmjBQlgBL0aV1/p1hLuPqJffJU/ykxOl5SCYjX0w8lM6ZDzn/h4OQM
 v8iZz/zMKNp1g6WS/AIJTMbpJ4LzToD9+DMqVXWnsiSk45k2R2Alcq8gngIfxEIGa7NM
 uwWw==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTIuMDYuMTkgdW0gMDk6MjYgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPiBPbiAyMDE5LTA2
LTExIDY6NTQgcC5tLiwgU3REZW5pcywgVG9tIHdyb3RlOgo+PiAodjIpOiBSZXR1cm4gMCBhbmQg
c2V0IG1lbS0+bW1fbm9kZSB0byBOVUxMLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUb20gU3QgRGVu
aXMgPHRvbS5zdGRlbmlzQGFtZC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIHwgMTggKysrKysrKysrKysrKy0tLS0tCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Cj4+IFsuLi5d
Cj4+ICAgCj4+IEBAIC0yODQsNiArMjg0LDE0IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZyYW1fbWdy
X25ldyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPj4gICAJaWYgKCFscGZuKQo+
PiAgIAkJbHBmbiA9IG1hbi0+c2l6ZTsKPj4gICAKPj4gKwkvKiBiYWlsIG91dCBxdWlja2x5IGlm
IHRoZXJlJ3MgbGlrZWx5IG5vdCBlbm91Z2ggVlJBTSBmb3IgdGhpcyBCTyAqLwo+PiArCWF0b21p
YzY0X2FkZChtZW0tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZULCAmbWdyLT51c2FnZSk7Cj4+ICsJ
aWYgKGF0b21pYzY0X3JlYWQoJm1nci0+dXNhZ2UpID4gYWRldi0+Z21jLm1jX3ZyYW1fc2l6ZSkg
ewo+IFNob3VsZCBwcm9iYWJseSB1c2UgYXRvbWljNjRfYWRkX3JldHVybiBpbnN0ZWFkIG9mIGF0
b21pYzY0X2FkZCArCj4gYXRvbWljNjRfcmVhZC4KPgo+IEFsc28sIEFGQUlDVCB0aGlzIGRvZXNu
J3QgYWxsb3cgYW55IFZSQU0gb3ZlcmNvbW1pdCwgd2hpY2ggc2VlbXMgYSBiaXQKPiBjb25zZXJ2
YXRpdmU/CgpUaGlzIGlzIHRoZSBsb3cgbGV2ZWwgVlJBTSBtYW5hZ2VyLiBIZXJlIHdlIGNhbid0
IG92ZXJjb21pdCBhbnl3YXkgYW5kIApuZWVkIHRvIHJldHVybiBlYXJseSBmb3IgVFRNIHRvIGV2
aWN0IHRoaW5ncy4KCkNocmlzdGlhbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
