Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F97EB46EF
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 07:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998106E0F8;
	Tue, 17 Sep 2019 05:46:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871BC6E0F8;
 Tue, 17 Sep 2019 05:46:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 22:46:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,515,1559545200"; d="scan'208";a="201762700"
Received: from svandens-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.54.141])
 by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2019 22:46:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: add drm device name
In-Reply-To: <CAAxE2A6sESsKAi3K1etAZeCwAPgexn099G6g0aJQnavTkiH+mA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190903214040.2386-1-sonny.jiang@amd.com>
 <CAAxE2A45N4gMYrcETDpznGKyxLztuwenFasL19a81QQmBkYiww@mail.gmail.com>
 <CAF6AEGvvUUOGujJC9P3t72N93AJuxiiVt0OAk8zf226Q8WmHvg@mail.gmail.com>
 <CAKMK7uHFNhdNY4Y9ZFMNuci7gssPWCT5f5y=e4npg8s5r_jBdQ@mail.gmail.com>
 <CAAxE2A6sESsKAi3K1etAZeCwAPgexn099G6g0aJQnavTkiH+mA@mail.gmail.com>
Date: Tue, 17 Sep 2019 08:47:48 +0300
Message-ID: <87woe7eanv.fsf@intel.com>
MIME-Version: 1.0
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
Cc: "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCAxNiBTZXAgMjAxOSwgTWFyZWsgT2zFocOhayA8bWFyYWVvQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gVGhlIHB1cnBvc2UgaXMgdG8gZ2V0IHJpZCBvZiBhbGwgUENJIElEIHRhYmxlcyBmb3Ig
YWxsIGRyaXZlcnMgaW4KPiB1c2Vyc3BhY2UuIChvciBhdCBsZWFzdCBzdG9wIHVwZGF0aW5nIHRo
ZW0pCj4KPiBNZXNhIGNvbW1vbiBjb2RlIGFuZCBtb2Rlc2V0dGluZyB3aWxsIHVzZSB0aGlzLgoK
SSdkIHRoaW5rIHRoaXMgd291bGQgd2FycmFudCBhIGhpZ2ggbGV2ZWwgZGVzY3JpcHRpb24gb2Yg
d2hhdCB5b3Ugd2FudAp0byBhY2hpZXZlIGluIHRoZSBjb21taXQgbWVzc2FnZS4KCkJSLApKYW5p
LgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
