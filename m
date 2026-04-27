Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK9QLxuu8GkfXQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 28 Apr 2026 14:54:51 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AE84854BB
	for <lists+amd-gfx@lfdr.de>; Tue, 28 Apr 2026 14:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD2C8911F;
	Tue, 28 Apr 2026 12:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ad+betp0";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A2E10E027
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 Apr 2026 21:39:39 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b9c01854477so696012466b.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 Apr 2026 14:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1777325978; x=1777930778;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
 b=Ad+betp0zFZlIbtGBFWAso51GwA+oeW4XoBDIakDga8l2bD0BCz8nx6pQDu6+lMlvE
 rjCcuZbVezydlpYGUjOuJqy+Kmh+7B8/q70WRNRTfnRvdha+3/YzlYbDZEURM7+XML+n
 Z9QE9sZT85x2zka6SoGj0B8N1C5RXfcQ8iuZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777325978; x=1777930778;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
 b=DdZyV3PmZWv5yNA25NYMWd29c3woAL37e7cVgxSehkoOpYDc4KOyok39PdjmsplSfM
 5Fl0rxpfuYCzfkOCN+9YroA0CIIiK6M9FgpXsFhOoVcQIBi1CqYksCgpIZy4g+pL4rzE
 EKVfYLC6gz4ZWAPT3tjEcbWJojwOk18eGFVUZWa70M5lbgaj+zXrrIP7/dWR/FTqCF/l
 L24lytqNUaGe7Ff4UswB29UIPTXsz1SsXOEjuebnZyE1XgMMg74WKDtlM9c4fV2UhzRw
 5ZYZk2GL4rH0hN/FfZaaFJ9ss6tbnU87w0d8oasZaNiI9DraxCKpAl4p9QXuT2U0qAc2
 yYxA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9PLSRhDjFc2iSZ/kP7kYAoFt7LnXcgdJkcRtXeZTVgPZohRp4R1l4PSxjteguQOTW9YKqJytZ2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYpGV/JYrBILnHXf6XnAvsaVqI6Ozap0qWWVIAH/p2MFwQsznL
 o3mLEtBLb/vH/tZ6IYtIxbG3FbPTHL3Zqvce/sW4dtuI4kN9fq/RZNuS6M4oMwWcLcSa9leymVd
 cHJC8+hgGng==
X-Gm-Gg: AeBDieuTWKRwwJNflBD80mXW4YY5GaLkflSQEU7Lz5EVQykcRG+5RF5nrXoHBXRok+Z
 I7IZUf/KPf1YLURiIL8gFBjlgtWw7UpBv+/S5ViS53KJ3Na1FlO7jZ4iyVxx5x3HI6hJx3Js+jW
 2tFMe89P/L5CVGtEkRCjc+siMI+IdZZpVqk7OPidUpwvUREbVKTNEnxzgUAKXnZ9BuaOlk7CSr0
 kixcbrdu8VYEu7FDx1SMOJrtcbUPkWA05RPiKuCPT0FKkxISxy7xVaxrGey1ep2pZ6FTC0cCcBf
 JkcMVMI4v+iI+xdNIf6Egj+A1S0dKA63f+yPSfTli7TWfOLKWzoowtGUiFkEXp+X5Uu9sUnePsa
 3FvUO8YrVMsIPa92yTaI6/w0pQ2DMOJxqwwlUb7B66twSfe9XZfTqly9M7UWOTlhFfNup9zo6Ap
 eFWLdsQcv9NAbHD0wrzBDS9derGsKDU2+5y2PuLjTSIDvCQZ0nr8mUZ6+VOIpFk7hnwvjgx910Z
 VvTpVzeEHU=
X-Received: by 2002:a17:906:f588:b0:bab:cab:c372 with SMTP id
 a640c23a62f3a-bb802da8f8emr31295866b.22.1777325977751; 
 Mon, 27 Apr 2026 14:39:37 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bb80b2adeaesm9083566b.32.2026.04.27.14.39.37
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 14:39:37 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-65c4152313fso14716971a12.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 Apr 2026 14:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ9Y1dMWdrV+hwBskmZbJwL1ifsz7X0KiA+UMjmL7z04cf1eWWlxu03hYa2Hrmf49t07+fhNuKAf@lists.freedesktop.org
X-Received: by 2002:a05:6402:5216:b0:679:1f4f:9d30 with SMTP id
 4fb4d7f45d1cf-679bb04c1a2mr179970a12.4.1777325976937; Mon, 27 Apr 2026
 14:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org>
 <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
 <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com>
 <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <20260427222914.1cb2dd3b@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:39:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
X-Gm-Features: AVHnY4I-AxqvQRk42MegvhKMp_z4sSEpEzhzpgw2GyV2bV8dezSPoI0JTlwB18Y
Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to
 copy_{to/from}_user_partial() when relevant
To: David Laight <david.laight.linux@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Yury Norov <ynorov@nvidia.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-um@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org, 
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
 linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, 
 linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
 bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 28 Apr 2026 12:54:20 +0000
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
X-Rspamd-Queue-Id: 67AE84854BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:chleroy@kernel.org,m:ynorov@nvidia.com,m:akpm@linux-foundation.org,m:tglx@linutronix.de,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:dmaengine@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-fsi@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:linux-wpan@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-serial@vger.kernel.org,m:linux-usb@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-fsdevel@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:bpf@vger.kernel.org,m:k
 asan-dev@googlegroups.com,m:linux-mm@kvack.org,m:linux-x25@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-sound@vger.kernel.org,m:sound-open-firmware@alsa-project.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-arch@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	FORGED_SENDER(0.00)[torvalds@linux-foundation.org,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux-foundation.org:dkim]

On Mon, 27 Apr 2026 at 14:29, David Laight <david.laight.linux@gmail.com> wrote:
>
> I think there is a slight difference in that the normal copy_to_user()
> will determine the exact offset of the error by retrying with byte copies.

I have this dim memory that we decided that you can't reply on byte
exactness anyway, because not all architectures gave that guarantee
for the user copies.

But that thing came up many years ago, I might mis-remember.

            Linus
