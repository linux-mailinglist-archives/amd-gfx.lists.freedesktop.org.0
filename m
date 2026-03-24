Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKRSLopVwmnNbgQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Mar 2026 10:12:42 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C163055D2
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Mar 2026 10:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DF810E63F;
	Tue, 24 Mar 2026 09:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XcVyf0ZH";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D475C10E5C7
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Mar 2026 08:07:14 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-486fb439299so40564815e9.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Mar 2026 01:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774339633; x=1774944433; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8bnpujtgHbsks7L4Tj5bUa0w9XirOzGs+CASTk1y64=;
 b=XcVyf0ZHiEdHAMVVrI5Ek5Vv/zgJi3S3LoK+8E+V76tbutg9VoQAQ2T4t/Y5++kuMZ
 S9TeZNBfNdjI7/Kdwrg7t3NoFVByY3ydGxIAeQUYcFDO66lotUhplYPlXyym1T334lMU
 20mu4Pk/eYh6XfSU0Jjgzx3S7X+YdDMSeE8P8g0HPfceqS3uLB6ZhC2KYKj1LHM3CVdh
 CnJitf7zHkE987AWZroMlenWnmsZPwPunJgPhKI75Kw0c8kqYlknL2Qg4vngYiFK2a9h
 cGgGgigssdwe1fqLrbqGekPli+PwtXAkQdS6902axkqqvm+zOr5XNAOXu0iM6c5h4oIW
 QvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774339633; x=1774944433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/8bnpujtgHbsks7L4Tj5bUa0w9XirOzGs+CASTk1y64=;
 b=U2xUonQb/BYo0RHiEsUcgLAYkOsgvReyqZD4VZLFaO6aQR23GJNIS3QsldZfsS3CnV
 1sgQXGDfx6Bco1o+xJudIvbKCTufa8JQEFWJpFxYDdP01qE9eEoExAMdTPrTpDuZfbwY
 YysM1ynlARAtp/qmdplLaSZCLkEdyw7X1YVPotDOa5Ve0S1owE9lW8WyzVom2qFuJG/r
 u944bfiJCNlnjOXxGNtLEG3PPHI8mlmEhIIBxcFAiv0U36XNxwcGttau1kT2q7ud487p
 pTI72dRG7UkytAUa24Wladq/1Fo+OWb7Y5xnBt+ByhacRMUZLTXqoNy/0wLvkrgMz0mG
 uMgw==
X-Gm-Message-State: AOJu0YzZ4zGU+hVLcN46XtpyfUrsrqWMbhpf22gY5tu978q/iiwdsNeU
 XZ+lfTUjIHCFchAIGDp2GzZHHkM8zAvGtWhfmiYBuS78Pi3Yb8AgY98P
X-Gm-Gg: ATEYQzyJwoajERu7JCnI313dcPY8enfPpJ1fGB6mXNFOXmISMzrgJPBBWHHwRnFy78A
 TQBFDFw7xtnR89YzgoTIylat9Zl9OjSDWT5XCYXU7Qhrwhi8RldmVKxe90nIYX/YQzM/mM7HYsP
 s7VKKbu4tY663G+f/mEWaITm350zErzMaUTIbYnzcZ+p8ClstewiYpUGRclF3bVM188RbwQ6t3/
 NBoFx+g5e5LyT71lVDedpR6InUWQW0dvDTVI2njRDeHyDWHHikF6ksgG3X4K9vXXTNL31SaRdcP
 LvV2S/MIc9lnnVJv1V69ZHi8wZn9neZb8BefcBW/t+Nf5vTABNvQYmOKsTjP1FXbUUFe4Puq/6N
 i81f4lj7ZiNLB3oqC5CuSYtcwgiTNOA6uXT7hM6wQ4u7NgivlB4m560VGZGNJDlegnCMLHt/1/Y
 PANSTAy9Y6dFi+PXiQvQ0GvA9paFmAHB69hgef/2vX7gK7rI79v6g=
X-Received: by 2002:a05:600c:3549:b0:485:3fe6:21f5 with SMTP id
 5b1f17b1804b1-486fedb5928mr203633045e9.10.1774339632859; 
 Tue, 24 Mar 2026 01:07:12 -0700 (PDT)
Received: from ionutnechita-arz2022.local
 ([2a02:2f0e:ca0b:2300:50e3:a57c:9a13:3636])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4870f822b83sm20298555e9.4.2026.03.24.01.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 01:07:12 -0700 (PDT)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/1] drm/amdgpu: Fix TLB flush failures after hibernation
 resume
Date: Tue, 24 Mar 2026 10:07:10 +0200
Message-ID: <20260324080710.12404-1-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d57a4e9c-d0a8-4ae0-b289-6131bde9c72e@amd.com>
References: <d57a4e9c-d0a8-4ae0-b289-6131bde9c72e@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 24 Mar 2026 09:12:40 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sunlightlinux@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sunlightlinux@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 52C163055D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Christian,

Thank you for the guidance on checking the KIQ ring test.

I apologize for the late reply - I haven't had time to investigate this
further as I've been busy with other work. I will try to look into the
KIQ ring test behavior after hibernation resume in the coming period
and report back with my findings.

Thanks,
Ionut
