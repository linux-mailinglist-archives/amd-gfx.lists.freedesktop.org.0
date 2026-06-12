Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pRjrL2JQLGoQPQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jun 2026 20:30:58 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D95A67BBB5
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jun 2026 20:30:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kVZGJZ3B;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VGdjlpdd;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=reject) header.from=qualcomm.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F420710F647;
	Fri, 12 Jun 2026 18:30:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D9410F64C
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jun 2026 18:30:55 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65CGTEd4020308
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jun 2026 18:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NXtGNwSbn+23h3fU54/tQRScTCRPWnaT0vFvr7Sg540=; b=kVZGJZ3B4K+cuLTh
 etACClER7Ykn+bsfS/JR//XpLDhYKlAQx0U7vr3ZodJtVrrOUjyt0r2p0PBNm275
 upsRU/dTJAlN8XvwxOjMs4r3v8iFLni1tY60wQueiS3dj1gaY6fjzWnPJr9kS1yx
 VQ7IJCdEY3P9Ak5VZTznpuvYgrIg0uSJOBvx4dsPqRMckHf/CBIeUN1yF3S0aZ0/
 dTCDt1+NsbNt7qnAC2DiBDPmAx+SQjedamokeR36s+Iznj5XrmZFcGQoRPXs/Nh7
 rTypSTH4AetIJoPDXl+xCvCRhljuMscXrQRWp2591WehC7AsHSBNLZN6xg1AZejZ
 nVY1wQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r7429p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jun 2026 18:30:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9159bc52211so181450385a.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jun 2026 11:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781289054; x=1781893854;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NXtGNwSbn+23h3fU54/tQRScTCRPWnaT0vFvr7Sg540=;
 b=VGdjlpddxwdfjxm2GJunOmvPiWUaXDMSa94ust76gE/mNMfuy0QVYCv+5h8U0BYOB+
 Z/+laHR4G4znu3F5Fk3wl+kbn1NPvhWRvOgDr6UNboVRRdXCvQpcgpC2e1b+2TeNz8YA
 5bO/nYtMJpftnCaea8D87V6yfge8MiXLiiS3PlG7ruWRt0BWGv8efdszKZcXQ9IkqJ/X
 1WfzUmIVpJ0aqqC+zqRyyQazswMXE9Bp+RSZH4p2HJMQqe0eGxZj23iSsgi/4EhPv3Zb
 RD6HvDxt+ywgKp3NkGEt8I8sR8Ab5HmkqDC347WaiXlK1RTQzk1ZBJ9PafRmGzWfjhJO
 acgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781289054; x=1781893854;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NXtGNwSbn+23h3fU54/tQRScTCRPWnaT0vFvr7Sg540=;
 b=L8RRY/4R5P6nhMw/axpda/w4xpmH5tGYcZsV3a/69p+vUiTU/qWJqDh3Q4q08tdWYk
 +yx93lrByAlVqfXEEefq0mrv32pvKNm71X+a0CXTdFLYCJYG39i7o4eTlGA5ht13cXXY
 gRn0gI+0SdqPztg6nKj2majdvRrTv8ZZMODCAMJpMA6h8m5F67QpBgRL4ThWYFOzkO45
 8Ssz4DdUu/S6I6Gp+pmyx6TxAxOQjn/3sTREN36Qq2D0EEtmnPjkkVkxYNLglOuDCQdV
 9g+BGE+Q9+CLkOxgRwkAWlZ62RTNoFRXOx8pm6bD9g/mhRa9T2v6aYPwa3r6aMRIkXRD
 vuBw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8yv5QdIqte0raNLwRuspdS3mV6780QcFFlpSgpGDOCYYFsX5DzPCNGJ71fRkHgYB7dA7Tib8cG@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHgGWohJD/vnWdj4ZiQk4xlOnhmTkoxzO5lJe1ebvmkGVB19yN
 XJXRmqxCZ0jzspQuw3PLEzAKnxBghJ9R1MOWCigEkm0ytduUZxFmTXrLxN28wylWVplJIczKsNl
 /GCV7pUR7Z5AGc7+4qOu9qZB6Vb9QMbMCQGdOtMvMMdS2ZvtYt7nfs0FIbilliJvrKYtR
X-Gm-Gg: Acq92OEZG1wRPAb9HZ4I1FqG/V/HYe2JtZ8Nrm1rpLtZwZh1mGpqTRoGWRC0AmJ2Da8
 pVvHR+wy84xUExV3v/hyMW9ZQUu5ae9rZaLLyXReU27SR3KeQ2nKID4f1CgRnWnOeAqEVk9Ey6V
 m/gjtBZK8sSbtzFEZc1bPJ0veZVvH77XU7A1rnqAHrrnCcDdykyX57VLrWwv394LdGiNBP8tplH
 UukpaSHCJGsAwL0XhkbglEhFz4fEWR9QG7oQ8c40VLv27fJqtW68ht9FSZL5o3h+TuKujMZoP9m
 skNjtV5KqLmFnOkXgbYTLc1Zv9O3erd7sqU1Ym0N+i2KQJ7lFwm9tulZQsy14uliaH93dbGXIw1
 wDARHB46MJl1eCOWxLzKnKO210YdDYA+7RTkCNv0dtfd2800djQtGXQM321djxZipCJoaNTrYAB
 Ldxjwg+zKcMFcwqLfCKezrCncPabL+Fx+DeUk=
X-Received: by 2002:a05:620a:414a:b0:915:6e30:5bd8 with SMTP id
 af79cd13be357-917ee4d8cf8mr137813885a.11.1781289039658; 
 Fri, 12 Jun 2026 11:30:39 -0700 (PDT)
X-Received: by 2002:a05:620a:414a:b0:915:6e30:5bd8 with SMTP id
 af79cd13be357-917ee4d8cf8mr137549085a.11.1781289026842; 
 Fri, 12 Jun 2026 11:30:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ad2e161fefsm742173e87.8.2026.06.12.11.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 11:30:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 21:30:14 +0300
Subject: [PATCH v6 4/9] drm/komeda: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-wb-drop-encoder-v6-4-9f3a54f81310@oss.qualcomm.com>
References: <20260612-wb-drop-encoder-v6-0-9f3a54f81310@oss.qualcomm.com>
In-Reply-To: <20260612-wb-drop-encoder-v6-0-9f3a54f81310@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3297;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hqraoBIhgsoA7488mFgE7E5Wa+zzdm/qHLJb+mlG/5g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqLFA2aShkfQ4NWcs8hWSV/gJ8/87+hOs9SkyEQ
 I647fJsaOCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaixQNgAKCRCLPIo+Aiko
 1aFGB/4lYLlcCC0eN4Dl4Jj27Lj0v182O24ArgNCoUv/0lOXuJBUpHJ3WQrRTWPQcktsb4msHdS
 zQM5LWwNwm4uSqkhlqE8zgwSBltp3eRPz8A3hJpAcBZxj3bRYxN0FZLq9qDHFYILD4kQ0TrIays
 BKCEWiDMd/NyT41rG/kuQQBqUR/Hqp/JKvvU0eeNHFnPo1wzO9+icOgiyChs7hnsgbacL15lz0f
 MXhI/HoKocbLvZ8gyux6T31biXcta4EaVpVdHwuVD5Q1+mGV2KQUGmkxI4dwALTAXTOzdIVqRXm
 AXQuEmxUAF0prLO9MqS6VTDsAd8tbX7KWWlBDVcTLRTAr0q5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: oaeT2dtqdBwAkInHwtqV4Yv5t2Q7ilVh
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2c505e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=gYs8AAvg_5cFonjPjrYA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: oaeT2dtqdBwAkInHwtqV4Yv5t2Q7ilVh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX8wKMx/lB84Yr
 R4XTTkkadQD71aWcPZkkvE1Vv5AmH80iLS1cUX01a1OSYsqOWYg1Q5q/9KNNxYH2x7gMR2mACrC
 5Z1Q2Cd4bP7+RmnotO58jtHBXeLWl+iOOnI80F0lgiZUu+upoXs3hn9yjAh9XFmahkUjBroNX9Q
 qh/VBbWsUDtxPW8d1oQBI+J5SChncrVuGA4kePtmemqnC4nScG0Awg/B2p9oMAYGJrMVC3W8AlX
 ljaQqLQ5uzeVcXFsGvaA1IMCJrRb3tayxM4vlO1KwzqtnZv0/Q/kkRQ+hkr/CsJRPUqgmVbzXHX
 ndPFscp59gsxNFdO6NJ/ED2cJ+XIW5feWZBoRxErGshs8df7pXgFZBDhk8xZGoVOnWOSX6gvehP
 kp8KFG6a/ktVWUPRBaDwuIE+MlFRZItP4nL31R/QSmBU2Cp8SdYNGDgKc+A54gdNUetR4+VeWqH
 GICMqMIdF65BBfPCLfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX3/Lmi3YsuwMg
 QWB99EUV4dVYhXCB54g2nC4nL2oYIY+uaySeJDjBrdLGLOAbWlXda4gBgiIhez+Fj4zMtkeyL3T
 cJeWaZHiwIR3sJkDF1hHfC4OVD5KWQA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120173
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:liviu.dudau@arm.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:suraj.kandpal@intel.com,m:louis.chauvet@bootlin.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,arm.com,ideasonboard.com,glider.be,raspberrypi.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email,bootlin.com:email,intel.com:email,lists.freedesktop.org:from_smtp,arm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D95A67BBB5

The driver uses drm_writeback_connector_init() instead of its drmm
counterpart, but it doesn't perform the job queue cleanup (neither
manually nor by calling drm_writeback_connector_cleanup()). On the
contrary, the drmm_writeback_connector_init() function ensures the
proper cleanup of the job queue.

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 41cc3e080dc9..bcc53d4015f1 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -5,6 +5,7 @@
  *
  */
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_managed.h>
 #include "komeda_dev.h"
 #include "komeda_kms.h"
 
@@ -121,17 +122,10 @@ komeda_wb_connector_fill_modes(struct drm_connector *connector,
 	return 0;
 }
 
-static void komeda_wb_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-	kfree(to_kconn(to_wb_conn(connector)));
-}
-
 static const struct drm_connector_funcs komeda_wb_connector_funcs = {
 	.reset			= drm_atomic_helper_connector_reset,
 	.detect			= komeda_wb_connector_detect,
 	.fill_modes		= komeda_wb_connector_fill_modes,
-	.destroy		= komeda_wb_connector_destroy,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
@@ -143,13 +137,15 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 	struct komeda_wb_connector *kwb_conn;
 	struct drm_writeback_connector *wb_conn;
 	struct drm_display_info *info;
+	struct drm_encoder *encoder;
+
 	u32 *formats, n_formats = 0;
 	int err;
 
 	if (!kcrtc->master->wb_layer)
 		return 0;
 
-	kwb_conn = kzalloc_obj(*kwb_conn);
+	kwb_conn = drmm_kzalloc(&kms->base, sizeof(*kwb_conn), GFP_KERNEL);
 	if (!kwb_conn)
 		return -ENOMEM;
 
@@ -165,11 +161,19 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 		return -ENOMEM;
 	}
 
-	err = drm_writeback_connector_init(&kms->base, wb_conn,
-					   &komeda_wb_connector_funcs,
-					   &komeda_wb_encoder_helper_funcs,
-					   formats, n_formats,
-					   BIT(drm_crtc_index(&kcrtc->base)));
+	encoder = drmm_plain_encoder_alloc(&kms->base, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &komeda_wb_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&kcrtc->base);
+
+	err = drmm_writeback_connector_init(&kms->base, wb_conn,
+					    &komeda_wb_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	komeda_put_fourcc_list(formats);
 	if (err) {
 		kfree(kwb_conn);

-- 
2.47.3

