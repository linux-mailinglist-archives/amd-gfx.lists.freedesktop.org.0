Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lqTjFP73TGohswEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 14:58:38 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED87C71B9A7
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 14:58:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QbuaaVHa;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FE410ECDF;
	Tue,  7 Jul 2026 12:58:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0056610EC14
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jul 2026 10:06:44 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-493c5220cb7so30628145e9.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 Jul 2026 03:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783418803; x=1784023603; darn=lists.freedesktop.org;
 h=to:from:subject:message-id:date:content-type
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=p0NYG5TD09/yR8WkDDiynJAqcMoU3ICsbKt6BPhGobM=;
 b=QbuaaVHaOc9E/Dw1+BHNeotdCY7dD/UuwGUdTPcLvgzG0A4Nd9TnDz5Z51tZFY7IJ/
 rJuQs/Xq/E5gitsH3Caa/0DEKybgpghzikq92wVhOlUJBEY4BhzSbzZ9wUR81PlYOKv6
 3r5sHix96M4fgmReibQwCeBRFvLR8L/kPEJ9HtrGEONXE0l5g1c/VBsWRXkaywY+X2K+
 qKiC8KfPweyI4UZB3bCp0j33IbZGs1OlnUQ2dI70zWbLLN7YlQTI61TvCMxLA3uPwGsO
 fd6cXccqNS/uvFPDL232nX/ZmrnqYoL/j5MWFs0RiZ3j6CQ7OQmeH8DmDG9c0AD88K6U
 BcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783418803; x=1784023603;
 h=to:from:subject:message-id:date:content-type
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=p0NYG5TD09/yR8WkDDiynJAqcMoU3ICsbKt6BPhGobM=;
 b=Bd0BTaRkX8k3o/QtUkVQkpyX6e7itkrVqrwr1l51kFCggK70apLngEckSFUeWAd6AK
 Vz6vyZS+ctdmltgxSCKYsjnA5XMMUWMmhMng3/IDMnkD8+C1yr+DEqu6wP4Hk8mtyq8q
 aSvcWnVnhLkRGEAvqCBTuwZGobent5Cl2j9rDCNWYSoC6KsMo3GroX4pthZc6RR+WhRA
 DrLK9GCudeBdgaI+mECnn6zBTyiA/YKG2z0fPHdB/UFg+zuSzFFkO78v+u35gQGRQqLs
 ib0KCWo4CJu+glRpuWbwXONdF0WhStqGr4x10hnd2WVn/hP3YLOq5HFBtYYIs8t1wsyP
 h20w==
X-Gm-Message-State: AOJu0Yx85tkk79Ni8Ymt2glleVNwo3WDUGjTIK4UIFABWOCOKE4PcASS
 Y/JHU9cQ8HTmOrFJw+WrqmZEUoB9QyLQ7cK3z8FtxeniP4RgfubR6zpSqPz2Oeit
X-Gm-Gg: AfdE7cmfe1thLtX4qk1be5LzwamSZaxWTBjDeCeDnAlAJG0F+We7iRbf6SN4xcHBZRp
 0UnD+j69mVWul3ts2xpQOw0PB+R+AZanjz2Z62Ocnueax7zPeKYqraf0rddfTWm7RJXPN5MngFg
 jvrNzJcR/y2IdgiElCYVmY2BnlWlQlZomCmiaRIX/QA3TAcrqvSoOuWf1V7JrzrwPD6Mq3ZhPr3
 eJNUFFvQj71PQNJ6ZIdoIv8S6ICeSMzoga8u9fi2j8ME+cPwqSc1p2rAgxYDNddEW2DdOJc0c+k
 8+Hc0BlCS5ssSH1JiHDqWahyGaHvRjhtTD6AIJNg8b2Q1jkMPyIxWf1Z5B3ERVird8d4GFpTOwA
 sXgOvHdDr25x91J5ersBhLxIO9mPsyw6EtKeMzYZuMhcoTkreJPfNU2Nvsz9y0XK70k+8YK0+Ef
 BqyqECmA+2Jwcj5Zm4
X-Received: by 2002:a05:600c:3b01:b0:493:c389:d436 with SMTP id
 5b1f17b1804b1-493df041c46mr45256345e9.9.1783418803241; 
 Tue, 07 Jul 2026 03:06:43 -0700 (PDT)
Received: from localhost ([193.30.163.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0fbd355sm40383395e9.13.2026.07.07.03.06.42
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 03:06:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 12:06:42 +0200
Message-Id: <DJS97B8F8T0P.3VZ24NB8R2DLY@gmail.com>
Subject: Question about HF-EEODB EDID extension override handling
From: =?utf-8?q?Timo_Pr=C3=B6mer?= <timo.proemer04@gmail.com>
To: <amd-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
X-Mailman-Approved-At: Tue, 07 Jul 2026 12:58:30 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[timoproemer04@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED87C71B9A7

Hi,

I am trying to get my Samsung Odyssey Neo G8 to run on 3840x2160@240Hz
over HDMI 2.1 (Linux 7.2-rc2), but that mode does not show up.

I noticed that the EDID only contains block 0 and 1,
even though the HF-EEODB specifies an extension block count of 3.

From my reading, the EDID parsing code in 'drivers/gpu/drm/drm_edid.c'=20
does respect this override as far as i can tell.
However I also found some code that appears to be copying / truncating the=
=20
EDID in 'drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:1208'
(function: 'dm_helpers_read_local_edid') without accounting for this overri=
de.

I am new to kernel-level development, so I apologize in advance if I=20
am misunderstanding the intended flow here. Could this be the reason for
my incomplete EDID? The kernel does not log any EDID-related errors or
warnings, so I am not sure whether this is expected behavior or a bug.

Please keep me on Cc; I am not subscribed to the list.

Thanks,
Timo Pr=C3=B6mer
