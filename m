Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0fzsA05QLGoEPQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jun 2026 20:30:38 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC16B67BB8B
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jun 2026 20:30:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dVL5BU2p;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q76qonUn;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=reject) header.from=qualcomm.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D35C10F63D;
	Fri, 12 Jun 2026 18:30:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4086110F63C
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jun 2026 18:30:33 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65CGVGH6047412
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jun 2026 18:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sTMi+rpeIeeTxwgAvd6Vb3BN+nfcxX4j3a3avZMj7+E=; b=dVL5BU2p5TxAPTdi
 S28MTvYXq86i+lhwR0HsWJot0vqed5Q82o8xOa1w+PaY4AYkw+ZdIC9xho1H4G/R
 Eg+Y0ltF4oVtQaKmvMa3k1+d+qqvQH4lH2iU/R8iRFX4qKKkWy2Xo5RbRidP3OXH
 AMhXLIrYWFn5kc0TMkqkYmh/GNb1hFoFrJ60ZCiw1Wwx9EQ2svsj03axFNKFIwew
 QN/lhY36dlaRIUs3D2RD7VZBCRaSBE1HeA5XAqLUwwET9iNqA7Mzj/iGugIOBz3P
 ffxADznUhAPiWxkM3tnnwOxLqDUIkU9RESdvor7Ns7uK3ja5rX3xsS14XLJGvBIe
 t8SRgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u440p1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jun 2026 18:30:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-915d33f7c28so246126085a.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jun 2026 11:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781289032; x=1781893832;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sTMi+rpeIeeTxwgAvd6Vb3BN+nfcxX4j3a3avZMj7+E=;
 b=Q76qonUnj1+h8IeqOjWkjBqjgA9kzlnU9+eC7lALXu1L88KXVjpUNV5rBRm5LbT/V/
 DGU0c/7hYOKStTCmi3Cat3LudmDF8TCq8vbsNh4UiQjQlEqNJXcgbttoOUOFswUUl0LG
 0ZrftQIyc+xmHPhls8BcDtJ3TX0NNyaAARMCi2l9D6jKxUUIgNKvCjnNtriPXEYpKL3a
 wVH++tD4oDTztFS/u6CQm4wSkj4F886l6ccVYAl/HBQC5lwQfdyYIIdQ2mdkD/wVWaSm
 eHxAc+UOmfdRI7V9dy+0MHzqtroROxbpCNgXpqY3sJCYH2K4Kcskyx0DLI4QV2MtydWh
 hD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781289032; x=1781893832;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sTMi+rpeIeeTxwgAvd6Vb3BN+nfcxX4j3a3avZMj7+E=;
 b=ThFMa4gUpFNF2ELDcfTsH9KjvBhQl1UhbUmodmlQn/p8X6Uyu+px9CHfZ2j46wtjAy
 AwW3Afr9YZHpFNkQXMs85XcuEG6zGl3uYGW4+eCDczgW6sQziiTzS3d7sP5Qi3ZtWEbb
 ZniHo9d2C94iRtMA7XXpsd0yy45Hibh4/G+UEMqYGfRRL/8JNJludM6ToGzzCuhWkOWH
 /acH2nRKZHE+xrjj1PiVRNHrXpBHBQLQMLnsJzJ+KK0qrrH21Rf7xRaV6UWO3RvhRaoP
 JN9VOv75bMP5MOvnt/PGERsAib180XhjCdzkujQJoybMCzOXEVZ2Q0nOjlA4EQur9N9t
 uIdQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+KZVNHi6q9H6O9wa9O8BpVIHjsdspwojTQCC/zH4mNZhsPMNCZ+4QkogY1VtKyYiwEDcr5xxpG@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMjJkVrVPCm+XVWT3uDGZgS0HxMnbzoz6pEVY/SA3MgT2eXAyG
 quwHIMUE0njhSSxr/ZfBhLLNXrNtwsfg5fcmyJGjIfA32xQwY5EHGNc3etBNTazywIR2MSENx3m
 xytjsi/1u3QaP7Ptthgeg9ZnKE6uFEdlT7gEMBaDIfTFaB3EndR449CeLdvCR1j2NmwZ7
X-Gm-Gg: Acq92OECbpzKQ9iBmTjO3dpQIjj16xN69SXuLEvMESr35yQTvamw7O6gN7gfblmuEtM
 nYSm4NP1+DmeHRO5JPIcEg+2igqt08XK1xkc4Vng63pWy4eUEF9noC4ET7xBiSJDuHx1LiU/oXv
 XWMqea7O8CsL55ESG/r6ZvSxY9C4bjPvackkFHgJb+3lrXcTQagG8T74bDRvLgzJzZxlXOBeSVp
 dX1ip/As6fnAeqnsycbY91dAysuoJMcEh1e8vulOeCRTSao4IVrVua82pxzvj4LT4KiySuy7edj
 7j5wd+DVDJIXqsrQtbhpvXYoUO9dGZ/WBuEO8eW7zgz/epXdOzPhn0PSDCD8PsljEdGDUATSS81
 QLlqSt5yR5uPCRrQxNuCzuiQieCARVksoYYdRhFn2JUd8BmCg82wG898utBKFKI3zmmqwgzYoSD
 qISkOrOWBS+WDKqdkwq/X5kFXxX952dmarFBw=
X-Received: by 2002:a05:620a:6497:b0:915:cda5:2807 with SMTP id
 af79cd13be357-917f1c595d9mr132340685a.57.1781289031595; 
 Fri, 12 Jun 2026 11:30:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6497:b0:915:cda5:2807 with SMTP id
 af79cd13be357-917f1c595d9mr132325485a.57.1781289031019; 
 Fri, 12 Jun 2026 11:30:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ad2e161fefsm742173e87.8.2026.06.12.11.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 11:30:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 21:30:16 +0300
Subject: [PATCH v6 6/9] drm: renesas: rcar-du: use
 drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-wb-drop-encoder-v6-6-9f3a54f81310@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2589;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Vucpdbps+yQVez32oDVtzt/iw6YyMI2r6E/Wi913Hw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqLFA2qL8S5YQqKBPsRn9MTFivondiBpU/eAjZX
 v1710/GiaSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaixQNgAKCRCLPIo+Aiko
 1bx1B/4qwPQtIu7I3Bwv5Sn6D3nPGP9G7fSvF58H/+/1e+BmXtWR0I52tzdypAxD6UGIshghp6r
 R9fC/vVHKY+cJlSIAkJvzdeviVpFG8H828Z976B2ZSeqgJ90a7o+vkfJEY03HCbBS9KVHQVmlWk
 wa43sUxKRxXS3xARc/fyWzjCVBtId3lFolo/JGuYlcdRpBqeoZB599OZQEeLetXVly3F13qILYK
 2pztXlzGcfm5HDqC6ZOH+E2UHqSGHreRU202s3H9mR2LSXaYbnAc+lwUfurempYYfrNrKzpnXyA
 kqUq1HqnbLF9EiHxM4hNn5Dyyf5KvcLTbq6A43ZbRgqn8F9/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: mR_CBkqyQpHmvK457H8aNhRY0rIoIF37
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX+M12KgFBfVCw
 880gY8IyLjY4jRYIGo9bl741ATlUrFqv2q5XKKDEaulLzsemYwcKN1uZHe1K1oRTo4EMm7az9Dg
 JIFkXKptrvAjCI+ToQxOPkQF80bhyHo=
X-Proofpoint-ORIG-GUID: mR_CBkqyQpHmvK457H8aNhRY0rIoIF37
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2c5048 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=rEXDA0v2x0ZtafRnR6sA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX7sx+NTlY0L7W
 o2t9b5NWZW30IuJL2HeIxSlWj54zvyh1DwAd5PW0i4U6lWWalqRCSzkxMlNQiZYiUJXnma2OQTN
 0lLWVln295PH+Fqsm+5jiwpy1COcbTcA7meArOVjQ7akmi85HWEabYxB5mh+l7PXfDIgZyfDvXK
 CxVtZJfO8KeUslMooiJrT84FYwFtxHxPMjyQylGeDPatXs/3YMYARu6nnxWIqApt4OEpk7vcOQG
 oHySpMtA/h95u1iLt5dUNqEZSbcHe7QybYBZhoMrzLEpws/YGirIYGsZyraib5QHHLJJ/SUjE57
 BR0cxh0sT5h1qr3ZTDdXEz9lBc1bpf1mMdPDWh0ByYWmkk/G7zUXEscXVeazmTrVWeZgSMctdyL
 pdOv85K8/KWBe1Elh0XKWkGLbtqNH8kgTlU1OPLjF4dQ3cI1IRVpb5BwnNrPRRv/vW3Kkj7igtg
 iUj+Z101XUUPdIaELQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120173
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,bootlin.com:email,lists.freedesktop.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,intel.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC16B67BB8B

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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index e5e6e6a156aa..ecfd4fc1f210 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs rcar_du_wb_conn_funcs = {
 	.reset = rcar_du_wb_conn_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = rcar_du_wb_conn_duplicate_state,
 	.atomic_destroy_state = rcar_du_wb_conn_destroy_state,
 };
@@ -201,16 +200,25 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 			   struct rcar_du_crtc *rcrtc)
 {
 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&rcdu->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&rcrtc->crtc);
 
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
-					    &rcar_du_wb_conn_funcs,
-					    &rcar_du_wb_enc_helper_funcs,
-					    writeback_formats,
-					    ARRAY_SIZE(writeback_formats),
-					    1 << drm_crtc_index(&rcrtc->crtc));
+	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
+					     &rcar_du_wb_conn_funcs,
+					     encoder,
+					     writeback_formats,
+					     ARRAY_SIZE(writeback_formats));
 }
 
 void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,

-- 
2.47.3

