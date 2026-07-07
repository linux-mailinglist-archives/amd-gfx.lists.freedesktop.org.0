Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LIyFGKpMTmqoKQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 15:12:10 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B0726A98
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 15:12:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=usp.br header.s=usp-google header.b=HaEE3nPf;
	dmarc=pass (policy=quarantine) header.from=usp.br;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D51A10E5E7;
	Wed,  8 Jul 2026 13:12:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BF510E522
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jul 2026 23:42:56 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-c9d1fc053e0so25621a12.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 Jul 2026 16:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1783467776; x=1784072576; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NTsYOw6uHozsquujsNCqPDcOi1VuziUuLK4jzy115/c=;
 b=HaEE3nPfzYK8A6we1C/cLxDaf9Zr0uwk6MuGIRVZUfKUPwwld3UUyPHnA5GzTOD9qp
 iFNU8+tAtNxgILnApH8EiHyVZj15V89UshCtZFa8MHk7bl4w2+/mx+Jf2g4wY9QK18C7
 r4FckETGKGPhMw6pg1ktQMvJV6C/tNFwqCSL+JHCa77fLmuLd9A2stRJg1dijnFuWRyu
 FEC49nSq8xsck3XiANMLRbyB7pfE3MIq+d3ZfABqsyLlWHf4VU2pBGFGpeED4KJBAuve
 aj6idYJ6/qIxoC3nKywnZ8uf3ECgwGGfo9z6OPu1FGG8tqm3gsvsthXMcYTgdU7W1AIX
 7gXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783467776; x=1784072576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NTsYOw6uHozsquujsNCqPDcOi1VuziUuLK4jzy115/c=;
 b=kSBRON/pWkvxqC9rjRkPxdinnvLT6854TH+yWj7O0ChoGw1AoC+9wpgQxMgFCPelWf
 gq73/WCFIOZlAgkLpQnWyXQhsEEEKmUgjPlgef5tWbg1PzRvgLDwVj4c1YZsv5W4Ve3G
 EtcL17ibUx0qH/+VZz20X7niG2yoqvdDZte9bX5Zc3Qy+OkB9g1jZjQSv1puO1vdOD3B
 8St/A4ytsSO+1UMbrmDsfwWsFe0ZpwvXCvSBtd7RDuJBLrSmS944IL2jH+iSIBSZXQmP
 aZEP8UHMYSFIkmFrzfk2ol5cK3iggDVb/jz+ivkTAh4oq1JNt/IN1rh4qd2xTCwR52c0
 Ujlg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqAOilXZMhw3O3thmoFGiubZJqKAKNzC3RbpITNKEj0vJ3HTbRMdSepttajnkBlZAQKw/oy/kuI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDvwrVdd+nPm1Fw+M9HqyA5nAQz/k7JvynsCZSQuk8yUvF1ASc
 AqyZ9jkzbBBhYXpbbx3Kmu2GIjcO6J3zhiBNaJNb7iXGp1P+auN4EP+H1g0VBsbC1lo=
X-Gm-Gg: AfdE7cll1/DMBUN6oUO7I8H797P0xJrGV/l25BSyzx+GXGr0lGv+1AVx7nys9t3RLcu
 wa0CCcTVqSlg1LVaQiXVvWXHIlguUCJEDIAIUO6bb/ItAkxA3x7a6mF+7edQSm3cBjfN4clYt1j
 HbWGYJ53zpbsh+68ezoMjXMT54RPs8wnTEIsIpHCduWBKsTHfw6avEU3dZUN3p34k3DsTAL2Lu4
 Xz0dxC9y0dPU6YFb3fwWj21x5yFWARwF2mYf/yHaqvb4AzBjm8ELqcZ4tTOcjK/2KlYEMFf9mGI
 OVvpbViYLZutC5RTdyG5H4VZBB2FuyHtbkBckzFPPqglp2IGT/mqYLwvYt6FuoGzUcKTjQZ5th8
 tbU38jUc6R/8MpDSUciL9HtzPtF0rfxRxofEObw8PyIL4z/11MQG70jSdS2KeaqpU7OQERj2r8o
 k=
X-Received: by 2002:a05:6a21:684:b0:3b5:6b5a:4f29 with SMTP id
 adf61e73a8af0-3c08ee38980mr7590280637.30.1783467775848; 
 Tue, 07 Jul 2026 16:42:55 -0700 (PDT)
Received: from arch-ideapad ([2804:7f0:3df:3dbf:fd10:7260:dc20:84b7])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31174ae6cd9sm13637822eec.31.2026.07.07.16.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 16:42:55 -0700 (PDT)
From: Ryan Oliveira <ryan.oliveiraf@usp.br>
X-Google-Original-From: Ryan Oliveira
To: ryan.oliveiraf@usp.br
Cc: airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, kaikycintra@usp.br, simona@ffwll.ch
Subject: Re: [PATCH RESEND] drm/amdgpu: Unify vm_fault_interrupt_state logic
 for gmc v10 and v12_0
Date: Tue,  7 Jul 2026 20:42:21 -0300
Message-ID: <20260707234221.34738-1-ryan.oliveiraf@usp.br>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260616184209.18014-1-ryan.oliveiraf@usp.br>
References: <20260616184209.18014-1-ryan.oliveiraf@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 08 Jul 2026 13:12:03 +0000
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
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[usp.br,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[usp.br:s=usp-google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,amd.com,lists.freedesktop.org,usp.br,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:ryan.oliveiraf@usp.br,m:airlied@gmail.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:dri-devel@lists.freedesktop.org,m:kaikycintra@usp.br,m:simona@ffwll.ch,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ryan.oliveiraf@usp.br,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ryan.oliveiraf@usp.br,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[usp.br:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D9B0726A98

Hi everyone,

Just a quick ping on this patch. Let me know if you need any changes or if there is anything I can do to help here.

Best regards,
Ryan O.
