Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s8FfBJBfR2rpXAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 09:06:56 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32056FF647
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 09:06:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ASrJMy1P;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A901710F689;
	Fri,  3 Jul 2026 07:06:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72F710F599
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 Jul 2026 19:48:45 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2c6770f12e4so1859485ad.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 02 Jul 2026 12:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783021725; x=1783626525; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=68hLmhb2rJT6HC8MF+9I9bjhr7Jl54P+QNhqjh8bKmw=;
 b=ASrJMy1P7XOgl9qrEGeBSCZqd3v/LmpovEkiMTk08pAtDMt7EmZHxYGowtaMsxAy+M
 pomP2poBnkRnvNRZ0uhN4WcnzX6ceg7yTTjutu6RapC35xdPsdnqiziih7CpMFmy8Jl/
 XSsgCRLiQMZuHWz4z0X3ssSYjLqZkdtE66r4cCBAApjclKjx5oLr2s7WHAaFIIpHE7vu
 UhE4lw4d9msD0fl93cePz1RTqhlx48GNS+0ijM1osiIp34/4/rrSctAyILcKZvNuN8U/
 l8QVlJC/20AVvS5ID3itDf6pl0gU1ppesJwjoTxXLUnwpyFxzRk/+mrKnxmjO3y6tiaZ
 yGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783021725; x=1783626525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=68hLmhb2rJT6HC8MF+9I9bjhr7Jl54P+QNhqjh8bKmw=;
 b=opHoK/nKpd5Pg7yf1OOprpH8nY6s40K5Lr330qPPW0lRrMQuAtfdGcjcb4aypjlQJV
 E0sUvegoM2gbX7MZt3RYRf0eRqte4511I7Y0bchY3dvD9ey4src1U0Xvx4hp7volTB36
 wfXFaKLtppM6ZlHAWQethzWqwbf99B6LATR/U/Z9QnuBWoOLAjT4NeRVzDV9rrf4c+7/
 6BKQhSWkGlrjHJ36L6331OtNZsaeMEeMlHyD6IIniVxRYIZesk8lAn7w3OXJlam23Y50
 p94/Jl6wAzk/9XlLGZlfZ6fuVAFjd/WcycTgvNpskJAQJVOyAmq8JedYFdRv1UXGuJ4s
 fHNg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqqTnKn7B9y+m0aP2kmNIM+OEksQqDBo+UE4LWue5jFKUUDulzCGUsxQaPe7soQJa5oETtSUaqy@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyfci0nxoX3YofGElGhXHTFNP8Bo3hdwKDsEeBjPLB+T2/tkR2x
 usxK2DZ8tFrG6HdwFZPP6L06Q4T3iLxcARUvVu4WrVpcJLEHHEhskHgf
X-Gm-Gg: AfdE7clW4rAJuQv9E0e4ArXJH6+nC9SnztwItPktwMq27i0TGPXx4p/VNM4OBw/9xo3
 /TTwSUEek0CQE39raFZYhO4/qm+fLm8QRaseq7WY/5lGASlwD3yTiG6L2qjDVIM+Ptpqt71Tjvy
 32caAKpU17jM0/ksE2koNv6Vnh1O6tJKEZgO2oGRnV6CuVZW/G/S0TMhis70Wnw9Ntm8ykI0IOg
 DinDfSqnOUTMULRtzUWWn82uzyiDAQcpn81QyuMHYNUrQK6fFP/aYjTmQknyfUxUAvyjxwma2SG
 ThD3TtjuSABhQ6VZlDBxWTZfbqPCBF9rF7iLIezS5HXoElKb6rWkMKVgeryaH0HA6+TA0u49M+T
 6DYabz7f8dW196UCfCTekI9ZLjC5X6KBYLFYwzM3cSq3xG1Gc8seifq3bfNJxgaANN9lcvvX6B/
 BvfB2R16vVEC6rLT1BhsSq6tR/Y/aTryw2d6lG7mSk436JlTTyCahv2KNLIQMvtX5iHDdZ8Q7cB
 8Oy1f7yZjD6Y589f/TfkajEoV0suo0W7xrwUXHA7veK8o/TzMogn9UC01nGP2tI8ZufPLR/tBJC
 Dh7ES51aVPCPuf4zR0QJ2oo8TkcQ9JSY+b5eyw==
X-Received: by 2002:a17:902:d490:b0:2c4:397:dd7a with SMTP id
 d9443c01a7336-2ca7e8cf2e3mr46822875ad.4.1783021725266; 
 Thu, 02 Jul 2026 12:48:45 -0700 (PDT)
Received: from midnightair ([2401:4900:1c94:62e8:bc10:77d0:2fda:415d])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13b3c7ef5b3sm16339527c88.1.2026.07.02.12.48.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Jul 2026 12:48:44 -0700 (PDT)
From: Anas Khan <anxkhn28@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Peichen Huang <PeiChen.Huang@amd.com>, Chen Ni <nichen@iscas.ac.cn>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Anas Khan <anxkhn28@gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove duplicate link_dp_panel_replay.h
 include
Date: Fri,  3 Jul 2026 01:18:38 +0530
Message-ID: <20260702194838.66361-1-anxkhn28@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702112828.34698-1-anxkhn28@gmail.com>
References: <20260702112828.34698-1-anxkhn28@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 03 Jul 2026 07:06:48 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:alexander.deucher@amd.com,m:siqueira@igalia.com,m:PeiChen.Huang@amd.com,m:nichen@iscas.ac.cn,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:anxkhn28@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,iscas.ac.cn,lists.freedesktop.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[anxkhn28@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[anxkhn28@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D32056FF647

Please disregard this patch. I did not notice that Chen Ni had already
posted the identical change back in February:

  https://lore.kernel.org/all/20260211021953.2504249-1-nichen@iscas.ac.cn/

Sorry for the duplicate.

Thanks,
Anas
