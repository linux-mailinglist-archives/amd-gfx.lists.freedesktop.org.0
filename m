Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9DEAB2EC
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Sep 2019 09:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D276E172;
	Fri,  6 Sep 2019 07:01:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8104892E2;
 Thu,  5 Sep 2019 08:46:55 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D6B0097C7232F14FB686;
 Thu,  5 Sep 2019 16:46:52 +0800 (CST)
Received: from [127.0.0.1] (10.177.29.68) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Thu, 5 Sep 2019
 16:46:51 +0800
Message-ID: <5D70CB7A.8040307@huawei.com>
Date: Thu, 5 Sep 2019 16:46:50 +0800
From: zhong jiang <zhongjiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
 rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: drm/amdgpu: remove the redundant null check
References: <1567491305-18320-1-git-send-email-zhongjiang@huawei.com>
 <62b33279-9ca9-5970-5336-a8511ce54197@web.de> <5D70A196.3020106@huawei.com>
 <dd351754-cb3a-b19a-64e1-f2f583c2a23a@web.de>
In-Reply-To: <dd351754-cb3a-b19a-64e1-f2f583c2a23a@web.de>
X-Originating-IP: [10.177.29.68]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:19 +0000
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS85LzUgMTY6MzgsIE1hcmt1cyBFbGZyaW5nIHdyb3RlOgo+Pj4gV2VyZSBhbnkgc291
cmNlIGNvZGUgYW5hbHlzaXMgdG9vbHMgaW52b2x2ZWQgZm9yIGZpbmRpbmcKPj4+IHRoZXNlIHVw
ZGF0ZSBjYW5kaWRhdGVzPwo+PiBXaXRoIHRoZSBoZWxwIG9mIENvY2NpbmVsbGUuIFlvdSBjYW4g
ZmluZCBvdXQgc29tZSBleGFtcGxlIGluIHNjcmlwdHMvY29jY2luZWxsZS8uCj4gVGhhbmtzIGZv
ciBzdWNoIGJhY2tncm91bmQgaW5mb3JtYXRpb24uCj4gV2FzIHRoZSBzY3JpcHQg4oCcaWZudWxs
ZnJlZS5jb2NjaeKAnSBhcHBsaWVkIGhlcmU/ClllcAo+IFdpbGwgaXQgYmUgaGVscGZ1bCB0byBh
ZGQgYXR0cmlidXRpb24gZm9yIHN1Y2ggdG9vbHMKPiB0byBhbnkgbW9yZSBkZXNjcmlwdGlvbnMg
aW4geW91ciBwYXRjaGVzPwpTb21ldGltZXMsIEkgd2lsbCBhZGQgdGhlIGRlc2NyaXB0aW9uIGlu
IG15IHBhdGNoZXMuIE5vdCBhbHdheXMuCgpUaGFua3MsCnpob25nIGppYW5nCj4gUmVnYXJkcywK
PiBNYXJrdXMKPgo+IC4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
