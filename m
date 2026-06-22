Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2lC+NOYXOWrzmgcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 13:09:26 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392B46AEF73
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 13:09:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nDwCWH5K;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5B510E626;
	Mon, 22 Jun 2026 11:09:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C4110E626
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 11:09:24 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490bc6a7958so39502765e9.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 04:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782126563; x=1782731363; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mnFRwyog2vTpmK7RSbZ3I519uJGLK8n4WMSRCaUqNSE=;
 b=nDwCWH5KLNKZpUtAj7PqQLpkNBBT9et+eXkqwv8t3PiazXQTDqE6uw3Hs9ia/Gbh8u
 UYP8d6MJ7+UV/5S/akoVWZHFEI/TSGvhxYbaf7/IRZd1/lFxCKFZxu0+rPxov4Dl7dKV
 sxypN4WPlWDl0oKX2iQqmaMZWJ5v6E7avBNTZAZVw0hTCECvCAKkGvgHWN0U4uKu40a7
 aTrGKB5KOEuErlgXq2vSyZdSI4umGBM1o69YoRjW6WpK/ZGk5d2x9v+On+KBVG1LVXlq
 mjsApncynXItrixNs2y1ue5xKikotgWQWS+WeFeBxO5D04hQCDlRcaG/vAgaF7D+g1fL
 souA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782126563; x=1782731363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mnFRwyog2vTpmK7RSbZ3I519uJGLK8n4WMSRCaUqNSE=;
 b=acDeI3uW1O44i53Ey/YDO+GKdbmjbmf8GcoFV/Q6qKHHMR+6DaeXlvmpRKhJ4M9gdJ
 sLXw7CRdxa0941PNmZdfFvw7usrb9/ORXFZTqGJe4nol4fk1/c3VzUmKERhNukxZ2czh
 EO+kQUMXDhDRNB+/jjAMt3q2lnzvtLXbOXynfN7Q5Rlq0mbpwvpB1sheZMcrKBcBaaWB
 wVToxwLZYY76pGwcpqPQ0Il6ycjLiKvtTToqWwlyKTr36MXkh4QpsMqpSqXHCvce71kS
 0tmVd3ZwRBF2jn03OArY5gsyu3dN9RC5ZGwgYDOVEQST3DfvY6egt6DknVxjXSKy35L4
 n09Q==
X-Gm-Message-State: AOJu0Yxt706zTmNsSQjNLjtd6GcibknZwA1TQXNwQY4zmbrUI9+eEBR1
 5d+ObYcybb51TZM8nWKyNZwK158RxBYeAZdjLuKbMlN00B42IWT+IR3vLslPrQ==
X-Gm-Gg: AfdE7cm4S2jtBkLLxzLzz3x4UaeoCoWN42FBL//vDnQQ7HRDUFNNX5k3qTtFglRGRHe
 wiO7eU/bDTvUqfy06hyQw7IHye9bOScFLT5QCOWIIKBA8sXys+pMdRQ1jfCBJqwMYL4EXBKATuj
 EMlLeh+6tOl54Hy36tZvDdS9f9jv74vL6ZxOy3Tv1U8fuuovxwrO1Qa7/T6IJWt0dHagPG7dFdK
 EEzQbVEuxITRsxJk6MTwiOgC4qDWNbt8fM90ZDMT+dRTvZZqinAiT9tIm00JqTs5zQrXFofIVhC
 j36O/xIgwi8SIz7f8sqV2f48NfOazWS2Lfn6CVhE0Gh31xl8Mw5QlpZiNIhdBtA74oYqi/pJ8kd
 Yk50GQ8BgD4VDBhOMFRbSqJaTXUlglG15PKm+R1NVHAWM59ZLjVu7d4079JgrAHSlYVECHzuPfN
 euTSNRc5H/+QiozVMqS2Eao8awqYSdXptqAkh+CSHdcUJLjSW5SaEQ2SFCWeg4yFisq/i2J8Oxr
 pMuJUFwr28bC3EvXFNXkS0vwxHd8g==
X-Received: by 2002:a05:600c:24b:b0:490:bf3d:c7de with SMTP id
 5b1f17b1804b1-49240a38c14mr134902725e9.10.1782126562607; 
 Mon, 22 Jun 2026 04:09:22 -0700 (PDT)
Received: from timur-max.localnet
 (20014C4E24F13B00B65759E31FE89790.dsl.pool.telekom.hu.
 [2001:4c4e:24f1:3b00:b657:59e3:1fe8:9790])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466648c5413sm26440531f8f.11.2026.06.22.04.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 04:09:22 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Reduce stack usage in IP block soft reset
Date: Mon, 22 Jun 2026 13:07:58 +0200
Message-ID: <27422769.1r3eYUQgxm@timur-max>
In-Reply-To: <IA0PR12MB8208536DAC79A742DB687A7B90EF2@IA0PR12MB8208.namprd12.prod.outlook.com>
References: <20260619171733.2976352-1-srinivasan.shanmugam@amd.com>
 <IA0PR12MB82087A22BE651E5AE05C3B6390EF2@IA0PR12MB8208.namprd12.prod.outlook.com>
 <IA0PR12MB8208536DAC79A742DB687A7B90EF2@IA0PR12MB8208.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Christian.Koenig@amd.com,m:Alexander.Deucher@amd.com,m:SRINIVASAN.SHANMUGAM@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,timur-max:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 392B46AEF73

On 2026. j=C3=BAnius 22., h=C3=A9tf=C5=91 11:10:40 k=C3=B6z=C3=A9p-eur=C3=
=B3pai ny=C3=A1ri id=C5=91 SHANMUGAM,=20
SRINIVASAN wrote:
>=20
> I took another look at the implementation. The temporary array is
> currently only used to collect the subset of affected rings and pass
> them to the multi-ring reset helpers.
>=20
> amdgpu_filter_rings() simply copies matching entries from
> adev->rings[] into a temporary array, and the helpers only iterate
> over that array.
>=20
> From what I can see, adev->rings[] appears to be a stable device ring
> list, so it seems possible to eliminate the intermediate array
> entirely and have the helpers iterate directly over adev->rings[]
> while applying the same ring_type_mask filter.
>=20
> Hi Timur, was the temporary array intended to provide snapshot semantics
> for the affected rings, or was it mainly introduced for convenience?
>=20
> If there is no snapshot requirement, I'll respin the patch by removing
> the temporary array altogether.
>=20
> Regards,
> Srini

Hi Srini,

I'm sorry for the trouble, I haven't seen this warning.
Please give me a moment, I can send a fix later today.

Thanks & best regards,
Timur




