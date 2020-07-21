Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A91228352
	for <lists+amd-gfx@lfdr.de>; Tue, 21 Jul 2020 17:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6296689385;
	Tue, 21 Jul 2020 15:14:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778106E58A
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 Jul 2020 14:55:15 +0000 (UTC)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 932DF20646091;
 Tue, 21 Jul 2020 16:55:12 +0200 (CEST)
To: Kees Cook <keescook@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: [Regression] hangs caused by commit 3202fa62fb (slub: relocate
 freelist pointer to middle of object)
Message-ID: <15cbac6d-1f96-2ba9-cb54-08af6682f56d@molgen.mpg.de>
Date: Tue, 21 Jul 2020 16:55:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Tue, 21 Jul 2020 15:14:38 +0000
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
Cc: Anthony Ruhier <anthony.ruhier@gmail.com>, Duncan <1i5t5.duncan@cox.net>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Vinicius <mphantomx@yahoo.com.br>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RGVhciBLZWVzLCBkZWFyIEFuZHJldywKCgpObyBpZGVhLCBpZiB5b3UgYXJlIGF3YXJlIG9mIGl0
IHlldCwgYnV0IHRocmVlIHBlb3BsZSB2ZXJpZmllZCB0aGF0IApjb21taXQgMzIwMmZhNjJmYiAo
c2x1YjogcmVsb2NhdGUgZnJlZWxpc3QgcG9pbnRlciB0byBtaWRkbGUgb2Ygb2JqZWN0KSAKY2F1
c2VzIGEgcmVncmVzc2lvbiBvbiBBTUQgaGFyZHdhcmUgWzFdLgoKSXTigJlkIGJlIGdyZWF0LCBp
ZiB5b3UgdG9vayBhIGxvb2ssIGFuZCBhZHZpc2VkIGlmIHRoaXMgY29tbWl0IChhbmQgCmZvbGxv
dy11cHMpIHNob3VsZCBiZSByZXZlcnRlZCwgdW50aWwgdGhlIGlzc3VlIGlzIGFuYWx5emVkLgoK
CktpbmQgcmVnYXJkcywKClBhdWwKCgpbMV06IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9z
aG93X2J1Zy5jZ2k/aWQ9MjA3MzgzCiAgICAgICJbUmVncmVzc2lvbl0gNS43IGFtZGdwdS9wb2xh
cmlzMTEgZ3BmOiBhbWRncHVfYXRvbWljX2NvbW1pdF90YWlsIgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZngK
