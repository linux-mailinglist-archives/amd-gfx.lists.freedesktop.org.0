Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xPoXFJszNWp/ogYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 14:18:35 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA56A5A56
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 14:18:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TtUji9cJ;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BA910F550;
	Fri, 19 Jun 2026 12:18:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B481110F550
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jun 2026 12:18:28 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-39977ab0562so21099161fa.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jun 2026 05:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781871507; x=1782476307; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dLZ+pCnD0P0yEjXHP7s+d0OIOgshDvs2k5lhyVXVghQ=;
 b=TtUji9cJqns1GVmodR3q+XjhI/mpybhPXKxTQBaT5s3lX9Vz+aMhA4LRylJph1w6cz
 yoJpF3UjL8SZlUWiazRvDvENqNDXBXjJwR/uarKYqw5Mo5Nt1KgRl/THBv86BFIA0glE
 Tmsc4WR8c562yQuyy5LFhClZ7rwV3mBX6UiGlofZGTqyko91iuif9ldzV1xz/DStB0yC
 MSToQV6ZXUDEuMd37lqiZbemaPf69mHcMPZPJ7q0DG/WhipqkB3CSKqFBhs6M/ck9orv
 gc8ZY/1tSatOfLOQguyfAvV4O6qa7zULp62bb4yh7vT6dnKy3k3A9U9ajQtkBffMu5dT
 2rJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781871507; x=1782476307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dLZ+pCnD0P0yEjXHP7s+d0OIOgshDvs2k5lhyVXVghQ=;
 b=M7Vjigrwnvyh0UJopiAGhvIIiOfdfhHzRi48H6R0Bq25FNT7Xl+h39w7aHCikgw809
 DqxEAM6xexwe7toX8gXzT2IiSUcMM2djJqsm/Cs+kJbmETPPHcexQB09VIuw38wRQ/xL
 8PGxrTRCxNlzRue2xTbIVGqiyRCyLrz/ysVZBfloTu0IER0DgenHXuUStKiOqIhjVKaN
 JQ/wkV6E87k7q7s417sGJ8aRDt3iVyIz/zaJYMJK+JOOb7Eg9Ue/7dLeEFTwhcTIjn7N
 8IF0V2ksWmlMsyxY8QiniD5e2BKXWWMQOx10Ij92/1s4eEFzQt8Vzqo7T36sxVV2bgQ/
 8gnQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9F1oQGAasO+hhZQXkj1kGYNz9zBbOZhXZLUeHGF87lx8FC1o5Nr6qJ3YbI8it6B8TCtOt383D9@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxku2dJ2kbxT0fMmOuTD07AJX3tP7hxaRnopezFNtW6+NfL9I+f
 C2uYSUwRx/Ae7J+PGCzQRjkwZ1DEdmXlKRVYkIwOiZETOabmE2/joeSA
X-Gm-Gg: AfdE7clKrQ7GUyoAvddYVYmLcMxHZIT43raLPBOKibjDDw5EDXzhV1caXtFcRYyhLmK
 Cg2+dcNULDAFsLcL6mSN40xC6hGMXjWv0ucjtRSQ4IbxuQLv2PPECAK1fIJUPuLNXdybR6Ui7EI
 7o6tRkvYP2LkHpHoPr7I5U4ZdGAleWGh/i+d8uAVbKsHghuQap2KoGUnn8b2nQ1qu4mQvrpIsVn
 9y9+AmlE93l/pCKywgRB1/urKcwH7U/rxJUTxY1QAUyX1jfIGPWHPa3YRhi62V8Sowwhqxp+V0O
 gi7Wg0wakH+jzqtfcuSzbcT9tlib4z30CADv1+jfoVUt8egIitpWbVhux93XuND+ESNQTkMvETH
 HMjudRbZ06jk1bn2ZSAFWz7O55hEmaUZXl601pSMeFAdOR0J2IXotam616ur3gvTL5t7FIFmgJn
 DdqGjhd7M+Z/30sNN6iZ/udw==
X-Received: by 2002:a05:651c:211f:b0:399:1fbd:8f2f with SMTP id
 38308e7fff4ca-3998bd06f64mr8439831fa.9.1781871506548; 
 Fri, 19 Jun 2026 05:18:26 -0700 (PDT)
Received: from localhost ([188.234.148.119]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3998beca743sm4598331fa.5.2026.06.19.05.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 05:18:24 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu: do not enter fs_reclaim under notifier_lock
 in lockdep training
Date: Fri, 19 Jun 2026 17:18:18 +0500
Message-ID: <20260619121819.189293-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cbc54f68-b0bd-40ad-b5e7-ed8157128417@amd.com>
References: <cbc54f68-b0bd-40ad-b5e7-ed8157128417@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mikhailvgavrilov@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:vitaly.prosyak@amd.com,m:mikhail.v.gavrilov@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:mikhailvgavrilov@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBDA56A5A56

Makes sense, thanks. I won't respin this one then.

Vitaly, for the reorder, here is a deterministic reproducer so you can confirm
the splat on your side without a round-trip. It arms an mmu_interval_notifier
via GEM_USERPTR over anonymous memory, then forces reclaim of that exact range
with madvise(MADV_PAGEOUT), so amdgpu_hmm_invalidate_gfx() takes notifier_lock
under fs_reclaim in the calling thread. Needs CONFIG_PROVE_LOCKING and a fresh
boot; build/run notes are in the header. Happy to give Tested-by once you post.

// SPDX-License-Identifier: MIT
/*
 * amdgpu-notifier-reclaim-repro.c
 *
 * Deterministic reproducer for the false circular-locking-dependency splat
 * produced by drivers/gpu/drm/amd/amdgpu/amdgpu_lockdep.c.
 *
 * amdgpu_lockdep_init() (run at module load) calls fs_reclaim_acquire()
 * while holding the dummy notifier_lock, teaching lockdep that it is legal
 * to enter reclaim with the MMU-notifier lock held. The real notifier lock
 * is taken in amdgpu_hmm_invalidate_gfx(), which mm/ calls from inside
 * reclaim, so the reverse edge fs_reclaim -> mmu_notifier -> notifier_lock
 * is mandatory. The cycle is closed the first time reclaim unmaps a page
 * covered by an amdgpu userptr interval notifier.
 *
 * This program installs such a notifier (GEM_USERPTR) over anonymous memory
 * and then forces synchronous reclaim of that exact range with
 * MADV_PAGEOUT, which runs try_to_unmap()->invalidate_range_start() with
 * fs_reclaim held in the calling thread, closing the loop on demand.
 *
 * Requirements:
 *   - kernel built with CONFIG_PROVE_LOCKING (lockdep)
 *   - amdgpu loaded; run from a FRESH boot (the first lockdep splat of any
 *     kind calls debug_locks_off() and silences all later reports)
 *
 * Build:  cc -O2 -o repro amdgpu-notifier-reclaim-repro.c
 * Run:    ./repro                 # picks the first amdgpu render node
 *         ./repro /dev/dri/renderD129
 * Watch:  sudo dmesg -w
 */

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/ioctl.h>
#include <sys/mman.h>

/* --- minimal amdgpu uapi (self-contained, no libdrm needed) ----------- */
#ifndef DRM_IOCTL_BASE
#define DRM_IOCTL_BASE 'd'
#endif
#define DRM_COMMAND_BASE 0x40
#define DRM_AMDGPU_GEM_USERPTR 0x11

struct drm_amdgpu_gem_userptr {
	uint64_t addr;
	uint64_t size;
	uint32_t flags;
	uint32_t handle;
};

#define DRM_IOCTL_AMDGPU_GEM_USERPTR \
	_IOWR(DRM_IOCTL_BASE, DRM_COMMAND_BASE + DRM_AMDGPU_GEM_USERPTR, \
	      struct drm_amdgpu_gem_userptr)

#define AMDGPU_GEM_USERPTR_READONLY (1 << 0)
#define AMDGPU_GEM_USERPTR_ANONONLY (1 << 1)
#define AMDGPU_GEM_USERPTR_VALIDATE (1 << 2)
#define AMDGPU_GEM_USERPTR_REGISTER (1 << 3)

#ifndef MADV_PAGEOUT
#define MADV_PAGEOUT 21
#endif

/* ------------------------------------------------------------ */

#define BUF_SIZE (64ull * 1024 * 1024) /* 64 MiB, page aligned by mmap */

static int open_amdgpu_render(const char *forced)
{
	if (forced) {
		int fd = open(forced, O_RDWR | O_CLOEXEC);
		if (fd < 0)
			perror(forced);
		return fd;
	}

	/* try renderD128..renderD143 and keep the first that accepts GEM_USERPTR */
	for (int i = 128; i < 144; i++) {
		char path[64];
		snprintf(path, sizeof(path), "/dev/dri/renderD%d", i);
		int fd = open(path, O_RDWR | O_CLOEXEC);
		if (fd < 0)
			continue;

		/* probe: a zero-size userptr returns -EINVAL on amdgpu but
		 * -ENOTTY/-ENODEV on a non-amdgpu driver, which lets us tell
		 * the nodes apart without pulling in libdrm version ioctls. */
		struct drm_amdgpu_gem_userptr probe = { 0 };
		errno = 0;
		ioctl(fd, DRM_IOCTL_AMDGPU_GEM_USERPTR, &probe);
		if (errno == ENOTTY || errno == ENODEV || errno == EOPNOTSUPP) {
			close(fd);
			continue;
		}
		fprintf(stderr, "using %s\n", path);
		return fd;
	}
	fprintf(stderr, "no amdgpu render node found under /dev/dri\n");
	return -1;
}

int main(int argc, char **argv)
{
	int fd = open_amdgpu_render(argc > 1 ? argv[1] : NULL);
	if (fd < 0)
		return 1;

	/* anonymous, private, page-aligned region for the userptr */
	void *buf = mmap(NULL, BUF_SIZE, PROT_READ | PROT_WRITE,
			 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	if (buf == MAP_FAILED) {
		perror("mmap");
		return 1;
	}
	memset(buf, 0xa5, BUF_SIZE); /* fault every page in */

	/* REGISTER installs the mmu_interval_notifier (amdgpu_hmm_register());
	 * VALIDATE additionally faults the pages via hmm_range_fault() and
	 * binds them into GTT. ANONONLY matches our MAP_ANONYMOUS region. */
	struct drm_amdgpu_gem_userptr up = {
		.addr  = (uint64_t)(uintptr_t)buf,
		.size  = BUF_SIZE,
		.flags = AMDGPU_GEM_USERPTR_ANONONLY |
			 AMDGPU_GEM_USERPTR_REGISTER |
			 AMDGPU_GEM_USERPTR_VALIDATE,
	};
	if (ioctl(fd, DRM_IOCTL_AMDGPU_GEM_USERPTR, &up)) {
		perror("GEM_USERPTR (VALIDATE)");
		/* retry without VALIDATE: the notifier is still registered, the
		 * pages are present from the memset, MADV_PAGEOUT still works */
		up.flags = AMDGPU_GEM_USERPTR_ANONONLY |
			   AMDGPU_GEM_USERPTR_REGISTER;
		if (ioctl(fd, DRM_IOCTL_AMDGPU_GEM_USERPTR, &up)) {
			perror("GEM_USERPTR (REGISTER)");
			return 1;
		}
	}
	fprintf(stderr, "userptr handle=%u, interval notifier armed over %p..%p\n",
		up.handle, buf, (char *)buf + BUF_SIZE);

	/* Force synchronous reclaim of the notifier-covered range. MADV_PAGEOUT
	 * runs shrink_folio_list()->try_to_unmap()->invalidate_range_start()
	 * with fs_reclaim held in THIS thread, so amdgpu_hmm_invalidate_gfx()
	 * takes notifier_lock under fs_reclaim and lockdep closes the cycle.
	 *
	 * A few iterations (re-touching in between) cover the race where pages
	 * are already paged out on the first pass. */
	for (int it = 0; it < 8; it++) {
		if (madvise(buf, BUF_SIZE, MADV_PAGEOUT))
			perror("madvise(MADV_PAGEOUT)");
		usleep(50 * 1000);
		memset(buf, 0xa5, BUF_SIZE); /* fault back in for the next pass */
	}

	fprintf(stderr,
		"done: check dmesg for "
		"\"possible circular locking dependency\" / amdgpu_hmm_invalidate_gfx\n");

	munmap(buf, BUF_SIZE);
	close(fd);
	return 0;
}
