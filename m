Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8016F1FB60C
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2020 17:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026A76E02F;
	Tue, 16 Jun 2020 15:24:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9F36E07F;
 Tue, 16 Jun 2020 11:04:38 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4FF21990F3B21C913701;
 Tue, 16 Jun 2020 19:04:33 +0800 (CST)
Received: from [10.166.212.221] (10.166.212.221) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 16 Jun
 2020 19:04:28 +0800
Subject: Re: [PATCH 1/2] drm/amdgpu/debugfs: fix memory leak when
 pm_runtime_get_sync failed
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
References: <20200616063039.260990-1-chentao107@huawei.com>
 <a8fb3d27-d0f5-d28a-d24b-63be866ef76f@amd.com>
From: "chentao (AS)" <chentao107@huawei.com>
Message-ID: <882dba73-8384-919d-671c-a300db4ef0cf@huawei.com>
Date: Tue, 16 Jun 2020 19:04:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <a8fb3d27-d0f5-d28a-d24b-63be866ef76f@amd.com>
Content-Language: en-US
X-Originating-IP: [10.166.212.221]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 16 Jun 2020 15:24:44 +0000
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
Cc: tom.stdenis@amd.com, David1.Zhou@amd.com, Jack.Xiao@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, yttao@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T2ssIGkgd2lsbCBtb2RpZnkgaXQgaW4gdjIgcGF0Y2guCgpPbiAyMDIwLzYvMTYgMTQ6NTAsIENo
cmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gUHJvYmFibHkgYmV0dGVyIHRvIHJlbW92ZSB0aGUgZHVw
bGljYXRpb24gb2YgcmVzdWx0IGFuZCByIGhlcmUgYW5kIAo+IHRoZW4gdXNlICJnb3RvIGVyciIu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
