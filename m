Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B60347433
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Mar 2021 10:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022296E42C;
	Wed, 24 Mar 2021 09:11:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132CC6E974
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Mar 2021 09:11:53 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 3A94AC800AE
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Mar 2021 10:11:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Ngeee4lFGhq9 for <amd-gfx@lists.freedesktop.org>;
 Wed, 24 Mar 2021 10:11:49 +0100 (CET)
Received: from [IPv6:2003:e3:7f2c:fb00:2f7:3bb3:1f:bbc0]
 (p200300e37f2cFB0002f73bB3001fbbc0.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f2c:fb00:2f7:3bb3:1f:bbc0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 18438C800AB
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Mar 2021 10:11:49 +0100 (CET)
To: amd-gfx@lists.freedesktop.org
From: Werner Sembach <wse@tuxedocomputers.com>
Subject: Color mode exposed to user space?
Message-ID: <e557c681-4218-dbe3-4e92-f6eaf352b614@tuxedocomputers.com>
Date: Wed, 24 Mar 2021 10:11:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hello,

is the information which color mode is currently in used for a display (RGB, YCbCr444, or YCbCr420) exposed to user space somewhere?

If no: Where would be the best place to put code to expose it to sysfs?

Thanks in advance,

Werner Sembach


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
