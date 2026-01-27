Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KF63Df7KeGmNtQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Jan 2026 15:26:06 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754959596F
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Jan 2026 15:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067A910E581;
	Tue, 27 Jan 2026 14:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7eUaL8F";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWVI45/F";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2CC10E581
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Jan 2026 14:26:02 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60RA4Pgs171390
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Jan 2026 14:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LeBGXuVPBeSkZrySiP9d01PK
 e2NSJk5/OBYu735H4lg=; b=D7eUaL8F/NQC5dIugNwP0PYoJJ8XMLVA/hWsVtxI
 TzAG0cBfSO/OEVWj3LXovywqEr0h5KcKGsN1gbRNggn55uj5TJDlj0P5rz3fxiR5
 uQTSTvRKsWKqq+4Cy0kPTyOMgUonpOpduLhMhALGfpBU071fhmEWYSFjNYvI+wJF
 Qw+GJ64tAdNnxMco95gcqFEP8Cr1Tr4YCjwDaX9mFimeBof8Mz2WvS/HCLCk+o5V
 NNWFIh0XXSbz7xwg/dg13RYXOfzzxDzHQr+sGFOaI8oTYjsA8wPvpEwmb+ChduZp
 Y0HvDtg61ADlLO1qUzsxlcZnVGspsBhvv/VrlZEvFhPK1w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a340d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Jan 2026 14:26:02 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-5f535184cc5so5225424137.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Jan 2026 06:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769523961; x=1770128761;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LeBGXuVPBeSkZrySiP9d01PKe2NSJk5/OBYu735H4lg=;
 b=dWVI45/Ftp6vSCmNrCzcQ/PTRUk98SCDO1bZYzIGu48/TOLyTZluwXVf0lbS4yt83g
 eYDBHj6MpBWrxFfdWLWOzNB18tWStL44YEfa84P2jOtpJ/DVVlqtuYVZNtRP5n1fmSMY
 pd0ejRhQhQApzPo/WkX3kGI1TJRD0nHabmBY3dAuNd5Ibe9s6Iob+UDsebxrtxBynz4G
 iRz3Q7NawCGxeFdNVIj6ABnkodW2VFVbG3LtiKKr7U2+u8xnFGKWAXtJr+bIqbaJ6oPd
 wx+2f1n/iRsdO8xF5V6zMFD2ZDOXW2VR5irAqLqL5LMtCKaQaVeihWcUA5gvWXh20IYA
 Hv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769523961; x=1770128761;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LeBGXuVPBeSkZrySiP9d01PKe2NSJk5/OBYu735H4lg=;
 b=GUT6UaI25Imio/Z/qjH6AdDHXzm2pZ5WVfjfC4zeIhyP80TVJVwMp1hDu+5TCv4Edt
 kwSre40jS57HTC8koC08v2pKm3QiWXs2M0Imrs2cBU8WU5pbt5XEUFiy3Qdsl/5DCX/m
 TLAmNGpIpZG0wDrUyuRcckFhmh0KfohdJfc9xlcm156cqX6aQy1P+hZqf22DGI6W3opn
 qxy5YiOgNKklVSRpjWp3ELiS2QmCdcFTxLk4X523NK5GYj/cjOg3INtVjhsYr06IeoUd
 T8xghEjZKEIUPqbwykMj7dd6AQIu3S/ztnEcFpQXY5JMGyMtfth/qo8CZ6eZe04LhMXG
 Wfgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxtu7MRaRwexujyNz3rs+qtFvjkXvnd2hESJuxRE+jb/qEvzyOa+nF3xsLA55CljG/6mwzIc9H@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yypg49ohmTX+6zS6LSlX8q+6WgnXXHJ6G0YfBlULAI/CKf8joGW
 i+MQP/NOUO0IPPg8MadfSZRC4N9QlRmBMhYn0hEg2cafo9Nna8G/87NdJZ/+tiPQYTNIPihQUdj
 lTQc3nH8MVOy5F41uX3AoEn51fRigocyfxyQ4DtyURqHhH8VBVmEmxIaD5t2atr+yb5g5
X-Gm-Gg: AZuq6aJaDePmc8od92lMqIDVJ3lcEXoKWJw6WnHbNxhxjQgjoHmUbGOHrad4ny6VRbK
 pzAPYEV//vtz3le5zrxzNDhL13zhMFzFlJOhnBt4bfyAcVBmCyjXwBUtfxtYI/Bk0a5dedQeD/I
 MmN7feIWQyEyNHNiNomFDHAixWGPRf6g5RAeaHRt/d0KZ8b3BXbQU8iLHyqI9RX/JJl/Ry9wa8G
 N1JaYuo3F5Dnn2ceIcYhK0134cLQU+Hq6Iz63xi0c02M2BW5r16hsupbeaodEzffvI4eoZviVxy
 0N2lLICfBr+NzJt0DUuGtfmFlpGEuOZ1ciuMCjcB8oSUk08582Mr+1v8sW0EMhBCyE7N9Q0slQy
 j3M2bQpquZhSNez614No6XS/WVC1pipQNL+kgtgEGEDnmZl0M8Gj1KLLO5loHFMljS+BINRRwDv
 fBg5DJQWllVYfMWJ1k9FavGWQ=
X-Received: by 2002:a05:6102:4610:b0:5f7:24db:fdb8 with SMTP id
 ada2fe7eead31-5f724dc08c8mr478875137.25.1769523961056; 
 Tue, 27 Jan 2026 06:26:01 -0800 (PST)
X-Received: by 2002:a05:6102:4610:b0:5f7:24db:fdb8 with SMTP id
 ada2fe7eead31-5f724dc08c8mr478854137.25.1769523960506; 
 Tue, 27 Jan 2026 06:26:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59de4918965sm3637789e87.55.2026.01.27.06.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 06:25:59 -0800 (PST)
Date: Tue, 27 Jan 2026 16:25:56 +0200
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
Subject: Re: [PATCH v1 6/7] drm/ci: uprev IGT
Message-ID: <5vxrhiilcsaull2airasmc3pjqazvswrtojozz264i5vk3m6zl@pgkdwq46p4ho>
References: <20260127104406.200505-1-vignesh.raman@collabora.com>
 <20260127104406.200505-7-vignesh.raman@collabora.com>
 <zi7frtnecrzyei4fl4nmwmth3icnsyycxxobbrcwovbqfsfq4z@eh25dyfrjkqz>
 <9949e82b-6ec2-4975-939b-d6a709ecf43f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9949e82b-6ec2-4975-939b-d6a709ecf43f@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDExOCBTYWx0ZWRfXwcLVtCZE4XFS
 vx29ufIR8Q+yNxe1NPYV5Wec5LGL8Tz8omeQONOjFRUUQFKTsw/QwS535fXPKisux3+rPPTN8zu
 Sjlsab/5pQDR7Tr1htCJfcB/Y6r5EgrtnOvS6jxUgL+f2ZqpzrNkBVYeDRa4+JrSHWIq1yHwMCB
 PFo2WuP141g/cwXoQBOuQ4/k+igsf2qAsZtTLPVgYZ3Isr/Jeh1K0jd1hwT9EHa2T7h6LbHmi/Q
 mMfOQfpNftf4GpWqddH71Puw58IC/g0kB1xifH6bYo1K8IZdkX3naNEJ2WNzPOMNw4sxErBccXU
 rEpnWKXHYq9geFCaqpVaGudJaMkONneFRjhgzLKca37b8SYW2L4jwzd++lF4IiqRTBk9wJScQdB
 6KjL9e2tkgjeRZMZFmsesBnkqyv+G4xZKlURdl6oLMFxJxanpumJc4tkM5vA57EbLbyTjEZNz6V
 4X7g2NX+kI1WOJ+DMsA==
X-Proofpoint-ORIG-GUID: p3eDP5LbmfFUc5HOqo0WSyzI1SbEKEbu
X-Proofpoint-GUID: p3eDP5LbmfFUc5HOqo0WSyzI1SbEKEbu
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=6978cafa cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=ocmXNzLk5YWpj9Dh6n0A:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270118
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 754959596F
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 06:26:11PM +0530, Vignesh Raman wrote:
> Hi Dmitry,
> 
> On 27/01/26 18:01, Dmitry Baryshkov wrote:
> > On Tue, Jan 27, 2026 at 04:14:01PM +0530, Vignesh Raman wrote:
> > > Recent IGT [1] seems to be broken on MSM hardware, with many tests
> > > failing due to the old_primary->index != 0 assertion. Uprev IGT to
> > > the last known good revision where the tests pass, and update the
> > > expectation files accordingly.
> > > 
> > > [1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/a909ab05
> > > 
> > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > It is not clear, which parts here are due to Mesa uprev (yes, there are
> > some of those) and which are due to the IGT uprev. Please split into two
> > commits and make sure that Mesa-uprev passes more or less clearly.
> 
> The mesa uprev and the IGT uprev are already split into two separate
> commits. The IGT uprev only updates the IGT version in gitlab-ci.yml and
> xfails.

I think I was not clear enough: Mesa uprev also causes some of the
xfails. Those needs to be a part of the Mesa uprev commit.


-- 
With best wishes
Dmitry
