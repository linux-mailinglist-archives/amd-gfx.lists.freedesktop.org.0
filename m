Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF782C84A
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 16:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D9B89DC1;
	Tue, 28 May 2019 14:09:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn
 [202.108.3.165])
 by gabe.freedesktop.org (Postfix) with SMTP id C907A89A94
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 14:24:25 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([123.112.52.157])
 by sina.com with ESMTP
 id 5CEBF283000016EA; Mon, 27 May 2019 22:21:57 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 281274399391
From: Hillf Danton <hdanton@sina.com>
To: christian.koenig@amd.com,
	ckoenig.leichtzumerken@gmail.com
Subject: Re: [PATCH 02/12] dma-buf: add dma_buf_(un)map_attachment_locked
 variants v3
Date: Mon, 27 May 2019 22:21:48 +0800
Message-Id: <20190527142148.14640-1-hdanton@sina.com>
MIME-Version: 1.0
Thread-Topic: Re: [PATCH 02/12] dma-buf: add dma_buf_(un)map_attachment_locked
 variants v3
X-Mailman-Approved-At: Tue, 28 May 2019 14:09:32 +0000
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIE1vbiwgMjcgTWF5IDIwMTkgMTg6NTY6MjAgKzA4MDAgQ2hyaXN0aWFuIEtvZW5pZyB3cm90
ZToKPiBUaGFua3MgZm9yIHRoZSBjb21tZW50cywgYnV0IHlvdSBhcmUgbG9va2luZyBhdCBhIGNv
bXBsZXRlbHkgb3V0ZGF0ZWQgcGF0Y2hzZXQuCj4gCj4gSWYgeW91IGFyZSBpbnRlcmVzdGVkIGlu
IHRoZSBuZXdlc3Qgb25lIHBsZWFzZSBwaW5nIG1lIGFuZCBJJ20gZ29pbmcgdG8gQ0MgeW91Cj4g
d2hlbiBJIHNlbmQgb3V0IHRoZSBuZXh0IHZlcnNpb24uCj4gClBpbmcuLi4KClRoYW5rcwpIaWxs
ZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
