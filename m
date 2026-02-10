Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0j6SGx6ei2noXAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Feb 2026 22:07:42 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E091511F44A
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Feb 2026 22:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E380210E451;
	Tue, 10 Feb 2026 21:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOj42PKj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eN88VZ7P";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C171A10E070
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Feb 2026 21:07:36 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61AElT3K2169234
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Feb 2026 21:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WYekD6MnY0SEVsICbNMS91My
 xF2Htl8S3olx63sNyJE=; b=BOj42PKjqHWpHuUFFKX7fABB68llL9h3EjDxQ+m7
 RERiH64TbniHjMINOGhJxsL/cpuR5YC41SHlQk9ilvrSLQ5TzUeIPi+i09rdl2j2
 aAh48Z/KrFLSA4Q3VhLof+0nEPrq4Tsw2aVi8cvG+H57j7nheg60qt29lIzC/59H
 KDB9Ljm9wjXiNBP+W+TJPGxeKGosACMgNDLFAoBHrO80pUA9Msw1HWXhVgR11zsL
 spxo0TF6+3N4sa5NTOoD+34Pvymqqu+KcKOgL1bI7x/xGJ7Tzj2W8gvtiqfvYMPG
 lcNfvwfEZsxPldedJmGFaaJaxM1kQPqAUYd4+vQYw/u59A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c80drtnfv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Feb 2026 21:07:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c70fadd9a3so1751457885a.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Feb 2026 13:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770757655; x=1771362455;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WYekD6MnY0SEVsICbNMS91MyxF2Htl8S3olx63sNyJE=;
 b=eN88VZ7PpSk9EFUiuu16Kos1qN/UbKRRja5pf9B9MA5fnJWnDCZ/JtmuTOugZDNq8F
 VCNoC6YDoVD8cN4AmEKmVc2/1/rks7Mj8C6X0ivlzUpJLSRrjMMFr3iZwDulEU0v/aX9
 +wSPminB1Do2/1wTGEotUAdQuwaKwvEUsIPAy//Ru1OHAluSgRmlOY3x3HXzn46lYRlH
 +NV5y+QzEXYAtHBpPalajIks3E22k+p71ZbSNlztTdg+RgAtMyO4cB/JhsCrTazOCMPc
 bU8+r5NVbS2uoZL5AAsP2euUMhsXPQ+JXL3vwH5HnpDN2YDwxL1vatWjZJNEF/p3548C
 WZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770757655; x=1771362455;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WYekD6MnY0SEVsICbNMS91MyxF2Htl8S3olx63sNyJE=;
 b=R+Zs86SnNK4gxo4kQmcy9MLwUXB4NdqhisxWy4tMQFN8NSStwDrkh9JhHIZHUvBdlu
 3KUwLw8jB92XkTj7UM0LEhK1GFGd3Trwpq0SAkhvkhjTRvpDiOEkBmpaxM880VVd/HpS
 lpOjK9ESvt91u5HDWo6r26gdrbLMTC+mv2CRw2UajXiWmrrtzwu6Lk+cOdzPi/Dd56Ro
 v+tTMo1CS+8iJopKLl3SwpXwMJrTyky94Ee6k+Pf8JIDwFYwBFX1jyNlxv6Web/DAatz
 1moColRQ+zD09glV0gDpPCeAdP9wx7TPy6Ad/ExhUqMMupV/+uYPKBa/nXeWdJxP9T6O
 7EyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9vIJUx8DkohRoMfPIdjBI24y3CNqFVlSi/gr5x+dIMdr1u55our6d98CkOJhK9kCNd7Jc2azW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgPjkqpJtX2yv/iBQ2F1QDKHB7x+rv+gKfWmH0uGlNbhuv3mQw
 HhbMoiqPqpBdHhwwTyZ9wIxyFBOx7f9R9DKfA3wMN7eKbk2LaP1Vs7fuoJwq3v3giyb53euzilx
 Kx6ozIPmpXfu+YG1VvnKmZQEpl6JPfB4UlBiyBiZ1k2tN6B0WLINVxLbKtRnInslCJ+8k
X-Gm-Gg: AZuq6aJ+BGd3OC6OUaknOgxJZz+pKqX4nSj35X4/JQOpFySE6Fa+DgGrQXxMNmZSRwc
 ldyXhYV3O7Qtmt5TjD0OnBJuLnUF/Y9B76tCe+pOYC+AEuPwWmKN/FMGS8mwuVRfrXvqwMlMnMI
 k6WNFMMK49Gjwyy6NspiUXGTjCk6KL6y+ou6meP6/HAxyo7YoivMsfDEazpd3d03xRcqIF8uzTo
 OHJhIpuxLeFXIu48AX5GBT7AEioN9xUjgxZPQICyYL3rbdy1Bt2zrKXpGXHaVniIOcBq8Pm97dx
 TgK1gqdEljqBvuEsENUCTbPYGwn3xr7sgnDqnde0DMBki0ebt827k6iYZ5nlZv82digNkvKt4eG
 BaYZ3eIU1N8vlBGRU3fZK1RJoxLXgr6UfVmrHKvCLAjsbqqo3KSJzdm0HxSx6pQ//IcnRISyPqN
 wVVjuEBwClVNLx41JF4p6ARs1dbEF7kicQlMY=
X-Received: by 2002:a05:620a:4492:b0:8ca:1240:4990 with SMTP id
 af79cd13be357-8cb280bc385mr75881285a.86.1770757655217; 
 Tue, 10 Feb 2026 13:07:35 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:8ca:1240:4990 with SMTP id
 af79cd13be357-8cb280bc385mr75876785a.86.1770757654672; 
 Tue, 10 Feb 2026 13:07:34 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e44cf6ee4sm3514472e87.4.2026.02.10.13.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 13:07:34 -0800 (PST)
Date: Tue, 10 Feb 2026 23:07:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] drm/ci: uprev mesa
Message-ID: <sl7sjcaylfmemxnqfs72wcb4mv4smcn2knhcj4he7skmgawqey@mzgj7wwzjvgb>
References: <20260210071138.2256773-1-vignesh.raman@collabora.com>
 <20260210071138.2256773-4-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210071138.2256773-4-vignesh.raman@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE3NSBTYWx0ZWRfX8exTviUU1oLj
 nah7tOEse+m9kcwhdPnfiug5skgvTbHUug9VjfRbqfWECLl5asRp9/fUQGwuCDJWEv/gpBact4J
 X+nJtlZcyP7OBW821x15bQ1M47epm6MnDjvbWOvi/3q8A3BJrOQePWWbFRPajJ0lFlVy1XuUVcl
 NSsPGxz6coEqvvrGB3sWHUigpNicpqDzPfFz5qqeh4fC1lyl9zt/In/ybw3rQPA8tRmBhLARc/+
 GdtGA1Aoz6sCM1qNF03gKdbLn5o+J5WFV952ijiMNwy9muXkbqcJj1lKpIHhGdLe4wXVSdH88ox
 Wf6JEZBWgy9QHLObpjymy0t0dbd/82i5QlKbqwPkhCQmK7u0zisrzPpJtZ2RL4/lqYLIb1SsumT
 u/bLLPuex1DX1xYV/8BtXZ9u6UAM6RyrhQkK2Cjh+L4IHHlf0ahEOmYbvNmOPecAlgRxTU3CPQW
 p8o9AMLbEVSchP8v4nQ==
X-Authority-Analysis: v=2.4 cv=fd+gCkQF c=1 sm=1 tr=0 ts=698b9e18 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=eEoeB42FsikaTLMEZsIA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: ZDEyfkvIJJ7lhQsQZabwAJbdp4PG9hzM
X-Proofpoint-GUID: ZDEyfkvIJJ7lhQsQZabwAJbdp4PG9hzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100175
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vignesh.raman@collabora.com,m:dri-devel@lists.freedesktop.org,m:daniels@collabora.com,m:helen.fornazier@gmail.com,m:airlied@gmail.com,m:simona.vetter@ffwll.ch,m:lumag@kernel.org,m:robdclark@gmail.com,m:robin.clark@oss.qualcomm.com,m:guilherme.gallo@collabora.com,m:sergi.blanch.torne@collabora.com,m:valentine.burley@collabora.com,m:linux-mediatek@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:helenfornazier@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,collabora.com,gmail.com,ffwll.ch,kernel.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E091511F44A
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 12:41:32PM +0530, Vignesh Raman wrote:
> Uprev mesa to adapt to the latest changes in Mesa CI, such as:
>  - LAVA overlay-based firmware handling
>  - Container/job rule separation
>  - Removal of the python-artifacts job
>  - Use lava-job-submitter container to submit jobs
>  - Use of the Alpine container for LAVA jobs
>  - Various other CI improvements
>  - Remove bare-metal jobs and disable apq8016 and apq8096 jobs,
>    as these have been migrated to the Collabora LAVA farm
>  - Fix issues with rebase with external fixes branch
>  - Update expectation files
> 
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> 
> v2:
>   - Merge patch to fix issues with rebase with external fixes branch
>   - Remove bare-metal jobs and disable apq8016 and apq8096 jobs
>   - Update expectation files
> 

Thanks
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
