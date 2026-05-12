Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VkGFObcuBGqkFAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 09:56:39 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7DD52F273
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 09:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CE910ED32;
	Wed, 13 May 2026 07:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="vhQ2s/zF";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com
 [74.125.82.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606AA10E59E
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 May 2026 19:00:41 +0000 (UTC)
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-2ef8d6ba48bso3480231eec.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 May 2026 12:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1778612441; x=1779217241; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K1LUeqbzazsIc6mr20+RzO+gGoqsPMt05zm7tfAxS5c=;
 b=vhQ2s/zFXCsc1c4h+/xOKpmwmSWn/ND+S9Wn3SsABlvgnbgKVPsBrxdGeDNlxoN5zQ
 +p1bXU6Zw70S8RxAd2aVHFEprDOpIUOB15qc4oCBHnPzKAikxqO5RiQQib8/MpAvSIXk
 EbHU2Ga2RKx6fsBzFyWzA280HLxIhHAfEo8WG4ulNYEEbmtONo9PTzxVTveKI2oEeCnM
 U1GjWzR7SNQSJQFeucngt2BbNq/MlgZR8JGiONyWnHSQ9k9rEkrcg8/+IK5dI1yBmUFu
 CM+TE7xOrv2gCOgwZEXNTpOY9CJBcRzbUayggmlVZmhyc5EFFzCFU8jzT3VJGwHNYP7R
 +rJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778612441; x=1779217241;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K1LUeqbzazsIc6mr20+RzO+gGoqsPMt05zm7tfAxS5c=;
 b=NLEBbn9CTSE6Un46sUj7zJNxBHweGBqYGBz4GsoiSpj/SFiSYP1X1eCelmZ/uX6yXm
 4Z8qwQxiWE0yarl7oPE/PCQ/e5s9IkDTCo9jQT6F0GncVaW+wRr/rVPLaPEBOG17HL+q
 Wfiu2/QiRJ1u7vktfUd4b6BjxsSdMcQI5v4buOBZFij1IJXgBC0WHsfpFPGB+rsJxD9G
 aRiceO7VZuu7pBEJgcYC83mBOTaQJbLuvg7UaB+ip/Q9QOHVdMUtIFR+QBNPtGt6mCvE
 mDmJT/u50O3BRX/O0jMeGhW/iwbioj63LPpgQcjD/sHNRt5nZaqFF1E+FZKmBNQCr3vs
 FKSA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9VIseBxa9V4DQNj83TVtiuHWpW6fwEy817zAXqNoRqwoKZXOxmAntoayVWAqgGSIp4x/EFdN/x@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw38eAqMTed+q0V37+mGDTZbVVvMqlWqDTKPDH5wTiAkxxLmoBx
 3qhn2qSPl2nDO+3HaRnJ9BTXr/WEE3vCr7pEm3K6jPpDqI4sFpTtqj2ENBqjY4pm7uY=
X-Gm-Gg: Acq92OHTAR10EdyfysdpH1C5KepIKK6ZTynKwV5tDGpQ4qgzJ9sNsie/iWLEr5ba0qW
 Oox48KmgSTkm9CkKl+5V8WNd6NWol+8qBWuD113WGNfhHhIB4nYQgf0Ne2872l84RgfOrlbBQ+9
 ZUTR4B4zp04UgByniJRVlyYTEjcl8yyvl3iQjvGAtTXhYW2bteCi6Zq6aYqFWe0jAD7omp6+zUE
 hQqCudWfpMcNlUVS2PXNMbbXDBMr53Q0PQpj30BaJ+Sou/eu6XxEa/4UG4AXmh5M/b5M+Px3dRI
 1F554CtKc+0sXEF2Tt89geAWh7xCbReIt9E9XjIVXN/+f8z+J0j1zDEwlSK9tx3GdpU8aZgknB7
 S9MnjPay86qZp0bLeHhyW8a5/pziqUj7gFDGi9DxCTQ5/fndaG084lGNByuIUZQvwVcOp0kQs/q
 WxseH82eEwEuE4XUbDhcS8bgQHvZ42EeGTu+5IC1DuqHQLKVk2Ag0mULznd5uFwzh4dXMMgs8nF
 OAcsSQYHJHV3HgmWdjxWhIRDm3NngPwRgt8fF298IhcYkn3slRDqOsSgWk=
X-Received: by 2002:a05:7300:fb91:b0:2ed:a58c:942 with SMTP id
 5a478bee46e88-30117a7ba4bmr167426eec.8.1778612441175; 
 Tue, 12 May 2026 12:00:41 -0700 (PDT)
Received: from gui-host.Dlink ([177.140.77.53])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2f88914523csm18716616eec.29.2026.05.12.12.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 12:00:39 -0700 (PDT)
From: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com
Cc: Guilherme Ivo Bozi <guilherme.bozi@usp.br>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/9] drm/amd/display: convert GPIO translation logic to lookup
 tables
Date: Tue, 12 May 2026 15:59:43 -0300
Message-ID: <20260512190019.228440-1-guilherme.bozi@usp.br>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 13 May 2026 07:56:32 +0000
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
X-Rspamd-Queue-Id: 4A7DD52F273
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:harry.wentland@amd.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:sunpeng.li@amd.com,m:guilherme.bozi@usp.br,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,ffwll.ch,igalia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[guilherme.bozi@usp.br,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[guilherme.bozi@usp.br,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[usp.br:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[usp.br:mid,usp.br:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Action: no action

This series converts the GPIO HW translation logic used by
multiple DCN generations from large switch statements to
static lookup tables with shared helper functions.

The new implementation reduces duplicated translation logic
across generations and makes the GPIO mappings easier to
maintain and extend.

The series introduces generic GPIO translation helpers first,
followed by per-generation conversions.

The following generations were converted:

  - dcn10
  - dcn20
  - dcn21
  - dcn30
  - dcn315
  - dcn32
  - dcn401
  - dcn42

The dce60, dce80, dce110 and dce120 implementations were
left unchanged for now.

dce60 and dce80 contain special switch-case handling paths
that currently do not map cleanly to the new table-based
representation, so they were intentionally excluded from
this refactor.

No functional changes intended.

Guilherme Ivo Bozi (9):
  drm/amd/display: add GPIO HW translation helpers
  drm/amd/display: convert dcn10 GPIO translation to lookup tables
  drm/amd/display: convert dcn20 GPIO translation to lookup tables
  drm/amd/display: convert dcn21 GPIO translation to lookup tables
  drm/amd/display: convert dcn30 GPIO translation to lookup tables
  drm/amd/display: convert dcn315 GPIO translation to lookup tables
  drm/amd/display: convert dcn32 GPIO translation to lookup tables
  drm/amd/display: convert dcn401 GPIO translation to lookup tables
  drm/amd/display: convert dcn42 GPIO translation to lookup tables

 .../dc/gpio/dcn10/hw_translate_dcn10.c        | 484 +++++++-----------
 .../dc/gpio/dcn20/hw_translate_dcn20.c        | 432 ++++++----------
 .../dc/gpio/dcn21/hw_translate_dcn21.c        | 417 ++++++---------
 .../dc/gpio/dcn30/hw_translate_dcn30.c        | 432 ++++++----------
 .../dc/gpio/dcn315/hw_translate_dcn315.c      | 418 ++++++---------
 .../dc/gpio/dcn32/hw_translate_dcn32.c        | 386 +++++---------
 .../dc/gpio/dcn401/hw_translate_dcn401.c      | 392 +++++---------
 .../dc/gpio/dcn42/hw_translate_dcn42.c        | 193 +++----
 .../drm/amd/display/dc/gpio/hw_translate.c    |  86 ++++
 .../drm/amd/display/dc/gpio/hw_translate.h    |  21 +
 .../gpu/drm/amd/display/include/gpio_types.h  |  48 ++
 11 files changed, 1274 insertions(+), 2035 deletions(-)

-- 
2.47.3

