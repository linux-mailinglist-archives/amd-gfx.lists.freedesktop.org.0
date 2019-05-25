Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD62F2A70F
	for <lists+amd-gfx@lfdr.de>; Sat, 25 May 2019 22:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433566E184;
	Sat, 25 May 2019 20:47:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail7-214.sinamail.sina.com.cn (mail7-214.sinamail.sina.com.cn
 [202.108.7.214])
 by gabe.freedesktop.org (Postfix) with SMTP id 85D656E146
 for <amd-gfx@lists.freedesktop.org>; Sat, 25 May 2019 06:54:29 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.253.229.186])
 by sina.com with ESMTP
 id 5CE8E55C000058A8; Sat, 25 May 2019 14:49:03 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 910313394978
From: Hillf Danton <hdanton@sina.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 05/12] dma-buf: add explicit buffer pinning
Date: Sat, 25 May 2019 14:48:53 +0800
Message-Id: <20190416183841.1577-6-christian.koenig@amd.com>
In-Reply-To: <20190416183841.1577-1-christian.koenig@amd.com>
References: <20190416183841.1577-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
Archived-At: <https://lore.kernel.org/lkml/20190416183841.1577-6-christian.koenig@amd.com/>
X-Mailman-Approved-At: Sat, 25 May 2019 20:47:47 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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

Ck9uIFR1ZSwgMTYgQXByIDIwMTkgMjA6Mzg6MzQgKzAyMDAgQ2hyaXN0aWFuIEvDtm5pZyB3cm90
ZToKPiArCS8qKgo+ICsJICogQHVucGluX2RtYV9idWY6Cj4gKwkgKgo+ICsJICogVGhpcyBpcyBj
YWxsZWQgYnkgZG1hX2J1Zl91bnBpbiBhbmQgbGV0cyB0aGUgZXhwb3J0ZXIga25vdyB0aGF0IGFu
Cj4gKwkgKiBpbXBvcnRlciBkb2Vzbid0IG5lZWQgdG8gdGhlIERNQS1idWYgdG8gc3RheSB3ZXJl
IGl0IGlzIGFueSBtb3JlLgo+ICsJICoKcy9uZWVkIHRvL25lZWQvICBzL3dlcmUvd2hlcmUvCgo+
ICsJICogVGhpcyBpcyBjYWxsZWQgd2l0aCB0aGUgZG1hYnVmLT5yZXN2IG9iamVjdCBsb2NrZWQu
Cj4gKwkgKgo+ICsJICogVGhpcyBjYWxsYmFjayBpcyBvcHRpb25hbC4KPiArCSAqLwo+ICsJdm9p
ZCAoKnVucGluKShzdHJ1Y3QgZG1hX2J1ZiAqKTsKPiArCkJSCkhpbGxmCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
