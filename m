Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CC9849D36
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Feb 2024 15:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B8B10FA20;
	Mon,  5 Feb 2024 14:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="Z9XEH17V";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 445 seconds by postgrey-1.36 at gabe;
 Mon, 05 Feb 2024 13:49:09 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5703210F9F1
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Feb 2024 13:49:09 +0000 (UTC)
Received: from [10.10.2.52] (unknown [10.10.2.52])
 by mail.ispras.ru (Postfix) with ESMTPSA id 69A4B40F1DC3;
 Mon,  5 Feb 2024 13:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 69A4B40F1DC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1707140497;
 bh=YDCpBdBH44n875Uo+Dp3bavm/xtQGfLpbCMNSBVJmnM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Z9XEH17V488MN4orxS8XupWyLBttTuNEfX6vlHM0qtvrEDQcHVfOz/eF5MUDbxdfe
 rP3kfIIx/oU8hqAS5AiAaVdjGCKkQWinaQz69DXbGJYLves2mq7ysAmS/ulwIjEvDT
 pnE+hOQf2UjxwuFxnMnN+SF3n8DK4wPQlMN9OlLM=
Subject: Re: [lvc-project] [PATCH] drm/amd/pm: check return value of
 amdgpu_irq_add_id()
To: Igor Artemiev <Igor.A.Artemiev@mcst.ru>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: lvc-project@linuxtesting.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Evan Quan <evan.quan@amd.com>, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20240205122522.81627-1-Igor.A.Artemiev@mcst.ru>
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
Message-ID: <ac1c1709-8bb0-6713-132e-d9b149063169@ispras.ru>
Date: Mon, 5 Feb 2024 16:41:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20240205122522.81627-1-Igor.A.Artemiev@mcst.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 05 Feb 2024 14:40:05 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 05.02.2024 15:25, Igor Artemiev wrote:
> amdgpu_irq_ad_id() may fail and the irq handlers will not be registered.
> This patch adds error code check.

But what is about deallocation of already allocated memory?

--
Alexey



