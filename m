Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 584802A70A
	for <lists+amd-gfx@lfdr.de>; Sat, 25 May 2019 22:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5746E175;
	Sat, 25 May 2019 20:47:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 323 seconds by postgrey-1.36 at gabe;
 Sat, 25 May 2019 07:24:10 UTC
Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn
 [202.108.3.165])
 by gabe.freedesktop.org (Postfix) with SMTP id BC3C56E149
 for <amd-gfx@lists.freedesktop.org>; Sat, 25 May 2019 07:24:10 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.253.229.186])
 by sina.com with ESMTP
 id 5CE8EC53000070E3; Sat, 25 May 2019 15:18:45 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 296193394075
From: Hillf Danton <hdanton@sina.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 06/12] drm: remove prime sg_table caching
Date: Sat, 25 May 2019 15:18:37 +0800
Message-Id: <20190416183841.1577-7-christian.koenig@amd.com>
In-Reply-To: <20190416183841.1577-1-christian.koenig@amd.com>
References: <20190416183841.1577-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
Archived-At: <https://lore.kernel.org/lkml/20190416183841.1577-7-christian.koenig@amd.com/>
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

Ck9uIFR1ZSwgMTYgQXByIDIwMTkgMjA6Mzg6MzUgKzAyMDAgQ2hyaXN0aWFuIEvDtm5pZyB3cm90
ZToKPiBAIC0zMzEsMTQgKzI4MiwxOSBAQCBFWFBPUlRfU1lNQk9MKGRybV9nZW1fbWFwX2RtYV9i
dWYpOwo+ICAgKiBAc2d0OiBzY2F0dGVybGlzdCBpbmZvIG9mIHRoZSBidWZmZXIgdG8gdW5tYXAK
PiAgICogQGRpcjogZGlyZWN0aW9uIG9mIERNQSB0cmFuc2Zlcgo+ICAgKgo+IC0gKiBOb3QgaW1w
bGVtZW50ZWQuIFRoZSB1bm1hcCBpcyBkb25lIGF0IGRybV9nZW1fbWFwX2RldGFjaCgpLiAgVGhp
cyBjYW4gYmUKPiAtICogdXNlZCBhcyB0aGUgJmRtYV9idWZfb3BzLnVubWFwX2RtYV9idWYgY2Fs
bGJhY2suCj4gKyAqIFRoaXMgY2FuIGJlIHVzZWQgYXMgdGhlICZkbWFfYnVmX29wcy51bm1hcF9k
bWFfYnVmIGNhbGxiYWNrLgo+ICAgKi8KPiAgdm9pZCBkcm1fZ2VtX3VubWFwX2RtYV9idWYoc3Ry
dWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLAo+ICAJCQkgICBzdHJ1Y3Qgc2dfdGFibGUg
KnNndCwKPiAgCQkJICAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyKQo+ICB7Cj4gLQkvKiBu
b3RoaW5nIHRvIGJlIGRvbmUgaGVyZSAqLwo+ICsJaWYgKCFzZ3QpCgoJaWYgKFdBUk5fT04oIXNn
dCkpICAgPwo+ICsJCXJldHVybjsKPiArCj4gKwlkbWFfdW5tYXBfc2dfYXR0cnMoYXR0YWNoLT5k
ZXYsIHNndC0+c2dsLCBzZ3QtPm5lbnRzLCBkaXIsCj4gKwkJCSAgIERNQV9BVFRSX1NLSVBfQ1BV
X1NZTkMpOwo+ICsJc2dfZnJlZV90YWJsZShzZ3QpOwo+ICsJa2ZyZWUoc2d0KTsKPiAgfQo+ICBF
WFBPUlRfU1lNQk9MKGRybV9nZW1fdW5tYXBfZG1hX2J1Zik7Cj4gIAo+IC0tIAo+IDIuMTcuMQo+
IApCUgpIaWxsZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
