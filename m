Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGAFLe29/GnSTAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 07 May 2026 18:29:33 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644E24EC376
	for <lists+amd-gfx@lfdr.de>; Thu, 07 May 2026 18:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EC310E0BD;
	Thu,  7 May 2026 16:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YnJZZNG0";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B270D10E29B;
 Thu,  7 May 2026 16:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BEYSRI1ts1Dc483/vmuXrRD78Mho4nYcEd4Ou4NeA0A=; b=YnJZZNG0vG4tdTbGQ++0CB6Tyl
 8UwltCtqFmANdPxH2EBYKetnWs89YA9zL5X/8MRBi+lTPRB//vBFl7pvJ+SM9StO141lULmEQQbRn
 0quDkK3xBpObFYxnxBj/k0DwDCns4xfKOQDWwWwrVxnRRXcMleWS1reBRN+BILx4Zd6iYsh9ZFK5v
 xVRj4GFSEthCeL+uBq+MrHrJzkS0El3jkTm3Y0vNn2LqIiWEJHpzTkAFB+ccDthLbSgWq2myiC7Q6
 cpRHF/O9ZPFx0ZCVxQOTAzmAvI3z6vMZNthcmChmQsFgIkavbiUh941D+xiimR4EXRKpTVYFDMkbD
 sBf9+GVg==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=[192.168.1.133]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wL1au-007UD1-ET; Thu, 07 May 2026 18:28:59 +0200
Message-ID: <f6d9e805-328d-4d9c-8a40-32b47fcedd51@Igalia.com>
Date: Thu, 7 May 2026 09:28:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] drm/msm/dpu: don't mix devm and drmm functions
To: rob.clark@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
 <20260505-wb-drop-encoder-v5-1-42567b7c7af2@oss.qualcomm.com>
 <CACSVV00TsXn=yx2UeGpxvCWRkSdj0=_=3_s01wCaO1RDH8t_vA@mail.gmail.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <CACSVV00TsXn=yx2UeGpxvCWRkSdj0=_=3_s01wCaO1RDH8t_vA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: 644E24EC376
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	NEURAL_HAM(-0.00)[-0.972];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[John.Harrison@Igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx,renesas];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Resending because apparently it got sent as HTML and was rejected by the 
mailing lists...

On 5/5/26 14:49, Rob Clark wrote:
> On Mon, May 4, 2026 at 5:25 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>> Mixing devm and drmm functions will result in a use-after-free on msm
>> driver teardown if userspace keeps a reference on the drm device:
>> The WB connector data will be destroyed because of the use of
>> devm_kzalloc()), while the usersoace still can try interacting with the
>> WB connector (which uses drmm_ functions).
>>
>> Change dpu_writeback_init() to use drmm_.
>  From [1] it doesn't sound like userspace holding the drm device open
> is the issue (if that were possible, it seems like it would go badly),
> but rather the order of managed cleanup?
>
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/xe/xe_hwmon.c?id=3a13c2de442d6bfaef9c102cd1092e6cae22b753
So is this not an actual issue that has been seen in the wild? It is 
just a theoretical issue based on code observation?

If so, then maybe the comment should just be something like:

    dpu_writeback_init() was mixing devm and drmm functions - allocating
    using devm and then passing to drmm to manage. This creates the
    potential for a use-after-free bug as drmm and devm have different
    lifetimes. Fix that by consistently using drmm management.


John.

>
>> Fixes: 0b37ac63fc9d ("drm/msm/dpu: use drmm_writeback_connector_init()")
>> Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> Closes: https://lore.kernel.org/r/78c764b8-44cf-4db5-88e7-807a85954518@wanadoo.fr
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>> index 7545c0293efb..6f2370c9dd98 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>> @@ -5,6 +5,7 @@
>>
>>   #include <drm/drm_edid.h>
>>   #include <drm/drm_framebuffer.h>
>> +#include <drm/drm_managed.h>
>>
>>   #include "dpu_writeback.h"
>>
>> @@ -125,7 +126,7 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
>>          struct dpu_wb_connector *dpu_wb_conn;
>>          int rc = 0;
>>
>> -       dpu_wb_conn = devm_kzalloc(dev->dev, sizeof(*dpu_wb_conn), GFP_KERNEL);
>> +       dpu_wb_conn = drmm_kzalloc(dev, sizeof(*dpu_wb_conn), GFP_KERNEL);
>>          if (!dpu_wb_conn)
>>                  return -ENOMEM;
>>
>>
>> --
>> 2.47.3
>>

