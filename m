Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ9jAeC8wGlTKgQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Mar 2026 05:09:04 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DF82EC5CD
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Mar 2026 05:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3125310E3B6;
	Mon, 23 Mar 2026 04:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJM5pA+8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iz5cwlvg";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D7810E3B6
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Mar 2026 04:09:00 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62MN8E9f3529248
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Mar 2026 04:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5mLU7+MItDUu5Kth0lmGo6bE
 IH05p2nnnuPD4hW7xVo=; b=PJM5pA+8Rt+CP033st/WkGLskaoVd4kJ2BweO5Sh
 6RXUql+pqIyx8wo7KPHvogwy6ApWsQP1j0BPMjHgC1FBuyJnWnDgW2r2qI7TsUqi
 lqzMi6Ml1Ye0E10VE5n9jF9747H3vVQdENdPz5e1lV/gR0rao9xzqK82jWN3s8zY
 C+68PvP7iz/GbY1epbq9ej2RUlYmh+SJRFqMpVgU56cyWBwYsxkWmqfOrwhwjY3i
 yPCb5/wgJW3JLgpswMvct5EcWgxjtBFZLI9fRkVcdwy034NKz7D/cgD+XC6BYRHz
 bujwB1nCbXbN7gV/TlGRRsS6Fwg4gNHT1Tg+H3k8z7G3yA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8hkpc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Mar 2026 04:09:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-50b469e5543so16707041cf.1
 for <amd-gfx@lists.freedesktop.org>; Sun, 22 Mar 2026 21:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774238939; x=1774843739;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5mLU7+MItDUu5Kth0lmGo6bEIH05p2nnnuPD4hW7xVo=;
 b=Iz5cwlvgxFAEKDlinCt0BDySwju4SEmPy1pgWGQlBZsmL0Qlm6xRF8YBeFedgWsj8f
 3SNAE4XPKOkFg4mK09zNLkIWlO2Xyp27DR1BSwuNKBsQX0/IsWRwK7XrQO1bENpxQsKy
 7KASWAQ68zvFJGnoz6D8W+QEitIJvwqoZlHQBUyG5hDYkkEdDz8sQjxw6nDoYNzJm5B6
 MvnoZr/XcDG6xpaOcivId5eRse79dVRL37DvpgVCBLCONfoFX35cf03BwIyJQNdYM3vB
 S8NnNT5ufPvp6IwXJe7GNeWVqgIKsyg6Llydw4i5idf+VsN4+E2luxgOgOIeA5B9fl56
 Utiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774238939; x=1774843739;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5mLU7+MItDUu5Kth0lmGo6bEIH05p2nnnuPD4hW7xVo=;
 b=GRBy0Cblk5lF8HivEt/v1s8DFzaQMBCAnTBz65Qv8sUOi7T3nxhO/PMNbsGp3Ex0qn
 ItCG+Eoiwo5gDzNMT4WQ49h30L8DVR/zfYAv8AwZqQOGpXdJU6LgHLBXjU2Q40TfMDjc
 XIZeII/otsolRbfrgztRVBsDmeCbAxHKDN8dvW+vPnOxSUbADrj+Y6GAs80tGa7MQMQs
 Y/foXk6ytvxtiRnmbS5Cn296tVzJsHZ/9r3gZK5eqfC4xKttcDNlvteZ5uLM2b5D8mcx
 1jllPhK5FG+zbRRlNfm2+yXqzfnxlRKfw4SvtE64lpZLeI7Enp/cSGzi4S8t4EMJ2TLe
 05Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXERDIvbri789RCv92hMlvg9vZFIlEiqMm2rwrDuWXJCWUhiXSlut4aBXlPhEeFsW9eGMOo1M1M@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+k1FLEWG32maD+lxRaX5W/G6e5U70LSfDYf81Y3NQs349aXd8
 cgSSyT+nEo83r7qt8C+3Y4Tvj0ipo6CwHTUrjBFYj6XsLk76QrTnjY6lZZAQXTVsi2S37mliTvk
 EFcd24kDBVRY1ksma5kwRw2C3KpjuhMDtl4juNE/xgcwFCObudh3R5hsh2xqtwjxqapP2
X-Gm-Gg: ATEYQzyU+ZQGtwrTmMstEs0pI9QpiwlbGc1L8Z7eabLGPMsq3Ek0wN0SQEqYQsvR227
 ZgQWJ2IxNFoIBzCrTeFl8rrgj7NdukOhXLr0qOUG49X8kad5bVSE7jq1o8dONm2FIk0TC29H0Xm
 oDvir3KjhvgFYcRWLFmeVFCNezTjPyVnVfZdGXZQWzw9hmHPLRBxG4UpFCI3hmG1FhxtSGr90cN
 sDXSdMULBC5Vcc61f7Xr319Z2PG0XQayoIyQOMZuIMop1hkCfDe6wkr5+z1HG67f8jDPmBtf6dd
 fXOHo16n0ALrNuP93p9rbJdCX/GOl0CQrZ0GKT0oVUwjHHqqBeQp0guURmnUxmpvd75G2MukixM
 oHQNPmYZogKFiOa2E2nMObOWoiQZWEFyPYi6ct/qFGGnDheJlz8PnsoH4k3J4ie2YhcpXIoE9UJ
 ZMP+Be209ZIdYEEufVeDg2PXJpMYJGRgC9XWY=
X-Received: by 2002:a05:622a:2288:b0:50b:55fb:1c87 with SMTP id
 d75a77b69052e-50b55fb20admr59358681cf.5.1774238939257; 
 Sun, 22 Mar 2026 21:08:59 -0700 (PDT)
X-Received: by 2002:a05:622a:2288:b0:50b:55fb:1c87 with SMTP id
 d75a77b69052e-50b55fb20admr59358441cf.5.1774238938791; 
 Sun, 22 Mar 2026 21:08:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a288268a0bsm1994449e87.14.2026.03.22.21.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2026 21:08:57 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:08:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 13/14] drm/connector: Remove DRM_COLOR_FORMAT defines
Message-ID: <lfq2myl6gnzog33md2madm3qky2x4sasbrqkthhvdvgtfigrjf@dc5ccj7iq444>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-13-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-13-f3935f6db579@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX7VsqcclzWc9P
 cLQEJ2T2FNBRouB14muonIDn4AzYm+UZ0XeXqvCNaJR+iZtMUwUtOWzKz9ZwzfJNjyPWXjG2elJ
 K79MWtlM9DNbtvpy6nNuLUmO2BRJ90E9NAPvq2646m2ZCPG4Kh4JOQqdCTQH30ISl3FEG6qeFkh
 4dSiqNc/2iD9j/CljqOXkbBJbocLdIY/QIqzZJBHk8NfhITfvUYIFTywlZWJGigF2A+NBXjtmI6
 qWeLnXxl5CZl/L11qIxjNhtmUq5rBQU/xPi4Jcy2mJJMvWXOzMAV0cK2lLxGjoV1jy8RXt/EjRz
 KeLoZ86p9Ka8ODiEG/Dm08FBjr+P0B9Ywyb4jdq66u7fDoRhzd6NCmRC41kZmEY0laJrSU/jlCw
 WXyUwMtjtNC91QAlBuqm8ovRAl7/FiFxXgUvWf62RCSV7SmzSO887ifuw57UFQVSTfZJaROrO1I
 sQD6649z/IvrIBjQisw==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c0bcdc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z8SGupnk27XsGNPOeu8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: NqgEqKxQIJ9qEIAS6e9lTnBzkGveVaC-
X-Proofpoint-GUID: NqgEqKxQIJ9qEIAS6e9lTnBzkGveVaC-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:nicolas.frattaroli@collabora.com,m:jani.nikula@linux.intel.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:andy.yan@rock-chips.com,m:liviu.dudau@arm.com,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:victor.liu@nxp.com,m:wens@kernel.org,m:samuel@sholland.org,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.i
 nfradead.org,m:linux-sunxi@lists.linux.dev,m:jani.nikula@intel.com,m:jernejskrabec@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,arm.com,pengutronix.de,sntech.de,nxp.com,sholland.org,raspberrypi.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim,qualcomm.com:email,intel.com:email]
X-Rspamd-Queue-Id: A5DF82EC5CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 05, 2026 at 10:05:05AM +0100, Maxime Ripard wrote:
> Now that all users of DRM_COLOR_FORMAT_* defines have been converted to
> the new enum, we can get rid of those defines.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_connector.h | 5 -----
>  1 file changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
