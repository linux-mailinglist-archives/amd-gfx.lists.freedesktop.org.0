Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DCB8526C
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 19:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C196E74F;
	Wed,  7 Aug 2019 17:53:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1841E6E742
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 17:44:40 +0000 (UTC)
Received: from mail-pl1-f197.google.com ([209.85.214.197])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1hvPzK-0006QB-Bk
 for amd-gfx@lists.freedesktop.org; Wed, 07 Aug 2019 17:44:38 +0000
Received: by mail-pl1-f197.google.com with SMTP id t2so53235239plo.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Aug 2019 10:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=36m4ZV+EDZBauWhmbVgsGcG+yyAWwpaN1oKQZhgxKsQ=;
 b=VMorvD9BvCiTLGPaGRUi8/EpvUaQkZZBzTewiXz4VUO5ogbdDh94RTE1OqQxvWtLLt
 z+jBg+xGrTzSvgaY6c4ZgjpnDRau2q6t5nyr/l6OY3o5nrVvbvPHs6j1hwUqCAHJ/123
 oP+wfxxtcZoF8UYXcbjvFiQhV50GgZlB8kid4ltr/konCLZRtHk6PNjlKVUBl5o1bSHI
 aIFs1i5Rc2xvXHMGWxcn9YfFhOahzkUvKDeSv6bRwia5V5+1BxZhxlu/BaXwJfBGUtjA
 /IANTrbo/RqRDCGlxw2/eTNSvSJvQtEncHN8tsbh4CoawFTRpht+/T5jylgkhROwMi3F
 6dtw==
X-Gm-Message-State: APjAAAVvVDXJ7WNbUNWlo3PYWgYuHiecTW0ObVHU0UfhnxEgE++TOrbH
 xPEeQuiDdySceXu5MrFIdDHUP1SR7fAPAmrKUX3wvcOMc9znoIrDY8P65L/IZnLYYyUYb9hHi21
 OFsKz0nrm1zOPCIUnpIkE4EN4ybzWRYeP+1qKiN1rOTU=
X-Received: by 2002:a63:3ec7:: with SMTP id l190mr8941774pga.334.1565199876731; 
 Wed, 07 Aug 2019 10:44:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzAjVzGaAHfi+Mx2RTAQF7DNZsnlHvJfIlucW5Pg3kOmc2JcioCuJG8VO3dWYSsyDV3OFW6Hg==
X-Received: by 2002:a63:3ec7:: with SMTP id l190mr8941755pga.334.1565199876307; 
 Wed, 07 Aug 2019 10:44:36 -0700 (PDT)
Received: from 2001-b011-380f-37d3-744a-8654-5394-196d.dynamic-ip6.hinet.net
 (2001-b011-380f-37d3-744a-8654-5394-196d.dynamic-ip6.hinet.net.
 [2001:b011:380f:37d3:744a:8654:5394:196d])
 by smtp.gmail.com with ESMTPSA id 81sm140348480pfx.111.2019.08.07.10.44.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 10:44:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [Regression] "drm/amdgpu: enable gfxoff again on raven series
 (v2)"
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <MN2PR12MB330979BAFF5BCC758258D54CECD40@MN2PR12MB3309.namprd12.prod.outlook.com>
Date: Thu, 8 Aug 2019 01:44:32 +0800
Message-Id: <624BFB8F-B586-492E-BEA6-4B138DAEC831@canonical.com>
References: <3EB0E920-31D7-4C91-A360-DBFB4417AC2F@canonical.com>
 <MN2PR12MB330979BAFF5BCC758258D54CECD40@MN2PR12MB3309.namprd12.prod.outlook.com>
To: "Huang, Ray" <Ray.Huang@amd.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Wed, 07 Aug 2019 17:53:10 +0000
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
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Anthony Wong <anthony.wong@canonical.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgUmF5LAoKYXQgMDA6MDMsIEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPiB3cm90ZToK
Cj4gTWF5IEkga25vdyB0aGUgYWxsIGZpcm13YXJlIHZlcnNpb24gaW4geW91ciBzeXN0ZW0/Cgoj
IGNhdCBhbWRncHVfZmlybXdhcmVfaW5mbwpWQ0UgZmVhdHVyZSB2ZXJzaW9uOiAwLCBmaXJtd2Fy
ZSB2ZXJzaW9uOiAweDAwMDAwMDAwClVWRCBmZWF0dXJlIHZlcnNpb246IDAsIGZpcm13YXJlIHZl
cnNpb246IDB4MDAwMDAwMDAKTUMgZmVhdHVyZSB2ZXJzaW9uOiAwLCBmaXJtd2FyZSB2ZXJzaW9u
OiAweDAwMDAwMDAwCk1FIGZlYXR1cmUgdmVyc2lvbjogNDAsIGZpcm13YXJlIHZlcnNpb246IDB4
MDAwMDAwOTkKUEZQIGZlYXR1cmUgdmVyc2lvbjogNDAsIGZpcm13YXJlIHZlcnNpb246IDB4MDAw
MDAwYWUKQ0UgZmVhdHVyZSB2ZXJzaW9uOiA0MCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDA0
ZApSTEMgZmVhdHVyZSB2ZXJzaW9uOiAxLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAwMjEzClJM
QyBTUkxDIGZlYXR1cmUgdmVyc2lvbjogMSwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDAwMQpS
TEMgU1JMRyBmZWF0dXJlIHZlcnNpb246IDEsIGZpcm13YXJlIHZlcnNpb246IDB4MDAwMDAwMDEK
UkxDIFNSTFMgZmVhdHVyZSB2ZXJzaW9uOiAxLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAwMDAx
Ck1FQyBmZWF0dXJlIHZlcnNpb246IDQwLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAwMThiCk1F
QzIgZmVhdHVyZSB2ZXJzaW9uOiA0MCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDE4YgpTT1Mg
ZmVhdHVyZSB2ZXJzaW9uOiAwLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAwMDAwCkFTRCBmZWF0
dXJlIHZlcnNpb246IDAsIGZpcm13YXJlIHZlcnNpb246IDB4MDAxYWQ0ZDQKVEEgWEdNSSBmZWF0
dXJlIHZlcnNpb246IDAsIGZpcm13YXJlIHZlcnNpb246IDB4MDAwMDAwMDAKVEEgUkFTIGZlYXR1
cmUgdmVyc2lvbjogMCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDAwMApTTUMgZmVhdHVyZSB2
ZXJzaW9uOiAwLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAxZTQ0ClNETUEwIGZlYXR1cmUgdmVy
c2lvbjogNDEsIGZpcm13YXJlIHZlcnNpb246IDB4MDAwMDAwYTkKVkNOIGZlYXR1cmUgdmVyc2lv
bjogMCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMTEwOTAxYwpETUNVIGZlYXR1cmUgdmVyc2lvbjog
MCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDAwMApWQklPUyB2ZXJzaW9uOiAxMTMtUkFWRU4t
MTAzCgpLYWktSGVuZwoKPgo+IFRoYW5rcywKPiBSYXkKPgo+IEZyb206IEthaS1IZW5nIEZlbmcg
PGthaS5oZW5nLmZlbmdAY2Fub25pY2FsLmNvbT4KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCA3
LCAyMDE5IDg6NTAgUE0KPiBUbzogSHVhbmcsIFJheQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXI7
IEtvZW5pZywgQ2hyaXN0aWFuOyBaaG91LCBEYXZpZChDaHVuTWluZyk7IGFtZC1nZnggIAo+IGxp
c3Q7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IExLTUw7IEFudGhvbnkgV29uZwo+
IFN1YmplY3Q6IFtSZWdyZXNzaW9uXSAiZHJtL2FtZGdwdTogZW5hYmxlIGdmeG9mZiBhZ2FpbiBv
biByYXZlbiBzZXJpZXMgIAo+ICh2MikiCj4KPiBIaSwKPgo+IEFmdGVyIGNvbW1pdCAwMDU0NDAw
NjZmOTIgKCJkcm0vYW1kZ3B1OiBlbmFibGUgZ2Z4b2ZmIGFnYWluIG9uIHJhdmVuIHNlcmllcwo+
ICh2MinigJ0pLCBicm93c2VycyBvbiBSYXZlbiBSaWRnZSBzeXN0ZW1zIGNhdXNlIHNlcmlvdXMg
Y29ycnVwdGlvbiBsaWtlIHRoaXM6Cj4gaHR0cHM6Ly9sYXVuY2hwYWRsaWJyYXJpYW4ubmV0LzQz
NjMxOTc3Mi9TY3JlZW5zaG90JTIwZnJvbSUyMDIwMTktMDgtMDclMjAwNC0yMC0zNC5wbmcKPgo+
IEZpcm13YXJlcyBmb3IgUmF2ZW4gUmlkZ2UgaXMgdXAtdG8tZGF0ZS4KPgo+IEthaS1IZW5nCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
