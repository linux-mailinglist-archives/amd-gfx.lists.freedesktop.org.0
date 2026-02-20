Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKx0DC4fmGnhAgMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Feb 2026 09:45:34 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BC1165E05
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Feb 2026 09:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6823410E800;
	Fri, 20 Feb 2026 08:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mIp/6N7K";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BB510E771
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Feb 2026 03:35:23 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3870df2331aso25614781fa.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Feb 2026 19:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771558521; x=1772163321; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qs3XtAW37afRA0+1P/Gos74N1AN9EdwS5RQcuwJVsX8=;
 b=mIp/6N7K3VXw4zFwiXo2IzSuOnqy2bdz06eHp+3qdAvdyD0hujxFwRMjNF+cfJ7NBI
 JKkMmn7XUBQHC4UMfjHPBAIcKNTSbIrqn//WVFVg3Cuv0LqX+37R0oZR5qF48OM4rw0D
 B1rTT6RmRZl1uodsrQO93jjj0k9XqUBoJBbwcADVYQ0020GUE6rt/PSjukFTSYHZD0Je
 mnoxiNv+x1zaNk3pG+dwAoinlHTuRePxSPp0Z0Mi8OsngmLhEFRa3VivXUEHlnSuJrhY
 a2i1dA63s3W+j/hRUsYn/PrIUA+HZNY57Dbb/cSzrAATwKwvXMmj/hG/1b452cW3kC8i
 m05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771558521; x=1772163321;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qs3XtAW37afRA0+1P/Gos74N1AN9EdwS5RQcuwJVsX8=;
 b=mqMelGeGsXKrvcihuEEW7waFGVqRtCm2Y+aZZeVQ1F3nvDaEOOB2+2d9HfQBejscMV
 TkV0Q7TNVqmKvTqyr+M//Ebbe2ed0wQ+J7ODneQOqQRSpvmOjD9O0C1DZXVcE41spLNm
 pwvkZTQoPWra4i227+AKt870QXObcU7w91fEMdt+9mOvgRUgShf/4q6TE4Rweop+Zefq
 MHTf3QBzWVylg+VmX3+3WSufehkOyWqcxdwj4EF8Zj37aL0p/xDZVWAEngd1ob133mzY
 pkManltu1ptV+ED/UFFOmYNG6NGiIB5xAgCjQ5D4VKWwctpRE3u7Ip1nbewnOFxXYOnb
 8z3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk2la1k/O6jgOUKpSCDlx0kr4W9gNeutE+BOcf6W0gq+ORarkn5EvuHMwZj+YpHHCP+dXUNIoL@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztbpcnLduJeNRREwPPKEiR8pyPL5DSohCcxaKj5ImMJpV1qSof
 pDoMSSjWha3LnSxCNK+QiDOkSUVaTuRr7m9MtdMb5Lg7I/2HWW3YodU=
X-Gm-Gg: AZuq6aIGwKOmWGD960Z0eTT1R+WeRYP2dpDfBYOpYxXNj8p4RsK9TvIyf8pcC/7hrsy
 /b+ZuL5i/tUF3Mz3+XoaHx1qHmByzfec0ONXIO2Vknog49g6MQPhnptixnzb/MQGOBNmG3gwicq
 twQo7+r136OzFZjhOGddKaWcs5V+QDvq2TI2eOjWKg/vb2R4kBI2W3N+MsS0R+itAZb49QrW6Op
 3X4iRoXn4tJdV1tcPH1cv9iNbM13hfv9ec8GhkEzZwptEJqK5xO5GxIrjinPuEWlHWMLT5Bjm2R
 mZPTuNQ17T55BZcEbJo+7MXXgikBPsj67vnPM2H9QjphW7VhxWWUi4nAW/SyyYViQJQsb920nVT
 /F/OaefVtOUjolZFqOGC71v3tySK71hhl6e2RFQelUWgLGdFSamyBpWjMFq3ajD59yT1wQguTES
 FJdQzxaZ0=
X-Received: by 2002:a05:6512:acf:b0:59e:62ea:239c with SMTP id
 2adb3069b0e04-5a011eb09e2mr110065e87.8.1771558521108; 
 Thu, 19 Feb 2026 19:35:21 -0800 (PST)
Received: from localhost ([2a0e:e6c0:20d0:4f00::1d])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f5ad733sm5745912e87.69.2026.02.19.19.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 19:35:20 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 06:35:19 +0300
Message-Id: <DGJH30US2XMK.S2HOHR14LIW0@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>, <regressions@lists.linux.dev>,
 <mwen@igalia.com>, <mario.limonciello@amd.com>, <alex.hung@amd.com>,
 <daniel.wheeler@amd.com>, <rodrigo.siqueira@amd.com>,
 <alexander.deucher@amd.com>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <christian.koenig@amd.com>, <huangalex409@gmail.com>
Subject: Re: [REGRESSION] VRR not detected on a DisplayPort monitor using an
 AMD GPU
From: "Ivan Sergeev" <ivan8215145640@gmail.com>
To: "Mario Limonciello" <superm1@kernel.org>, "Ivan Sergeev"
 <ivan8215145640@gmail.com>, <amd-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com>
 <090d89a2-4f80-44ef-827c-6462d8948493@kernel.org>
 <DGJFVPAQJA15.378GMU7XZXLU@gmail.com> <DGJGDIRQWDG7.XHHKF6UQP0HG@gmail.com>
 <c70fe261-7fb0-4af5-b755-f02b193c8c5f@kernel.org>
In-Reply-To: <c70fe261-7fb0-4af5-b755-f02b193c8c5f@kernel.org>
X-Mailman-Approved-At: Fri, 20 Feb 2026 08:45:29 +0000
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:regressions@lists.linux.dev,m:mwen@igalia.com,m:mario.limonciello@amd.com,m:alex.hung@amd.com,m:daniel.wheeler@amd.com,m:rodrigo.siqueira@amd.com,m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:christian.koenig@amd.com,m:huangalex409@gmail.com,m:superm1@kernel.org,m:ivan8215145640@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ivan8215145640@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivan8215145640@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.linux.dev,igalia.com,amd.com,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 01BC1165E05
X-Rspamd-Action: no action

On Fri Feb 20, 2026 at 6:14 AM MSK, Mario Limonciello wrote:
>
> Can you check out at your bad commit and apply just 7f2b5237e313 at the=
=20
> bad commit?  Confirm that fixes it.

Applied 7f2b5237e313 on top of 0159f88a99c9 and the issue persists.
