Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BC5E720B
	for <lists+amd-gfx@lfdr.de>; Mon, 28 Oct 2019 13:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17FC6E84C;
	Mon, 28 Oct 2019 12:47:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D89E6E50D;
 Mon, 28 Oct 2019 09:32:31 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id AAD97303C5BBEF6020BB;
 Mon, 28 Oct 2019 17:32:28 +0800 (CST)
Received: from [127.0.0.1] (10.184.213.217) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0;
 Mon, 28 Oct 2019 17:32:23 +0800
Subject: Re: [PATCH 0/3] drm/amd/display/dc/dce: remove some not used variables
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <1570602312-49690-1-git-send-email-zhengbin13@huawei.com>
From: "zhengbin (A)" <zhengbin13@huawei.com>
Message-ID: <96590591-d35f-6553-1b93-6d69a043590a@huawei.com>
Date: Mon, 28 Oct 2019 17:32:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1570602312-49690-1-git-send-email-zhengbin13@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.184.213.217]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 28 Oct 2019 12:47:35 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cGluZwoKT24gMjAxOS8xMC85IDE0OjI1LCB6aGVuZ2JpbiB3cm90ZToKPiB6aGVuZ2JpbiAoMyk6
Cj4gICBkcm0vYW1kL2Rpc3BsYXk6IFJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlcwo+
ICAgICAnYmxfcHdtX2NudGwnLCdwd21fcGVyaW9kX2NudGwnCj4gICBkcm0vYW1kL2Rpc3BsYXk6
IFJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlICd2YWx1ZTAnCj4gICBkcm0vYW1kL2Rp
c3BsYXk6IFJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlcyAncmVndmFsJywnc3BlYWtl
cnMnCj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYWJtLmMgICAg
ICAgICAgICB8IDggKysrKy0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
ZS9kY2VfbGlua19lbmNvZGVyLmMgICB8IDMgKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY2UvZGNlX3N0cmVhbV9lbmNvZGVyLmMgfCA1ICstLS0tCj4gIDMgZmlsZXMgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi43LjQKPgo+
Cj4gLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
