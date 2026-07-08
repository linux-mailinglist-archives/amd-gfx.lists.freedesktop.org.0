Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ZgROKpMTmqqKQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 15:12:10 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51160726A99
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 15:12:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=HqaPy0z3;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEFF10E5EC;
	Wed,  8 Jul 2026 13:12:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2930D10EFFC
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Jul 2026 06:23:27 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5aebfa21c62so354334e87.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 Jul 2026 23:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783491805; cv=none;
 d=google.com; s=arc-20260327;
 b=JH2ZRNTgETNGYKLCR2uUKsvYBC+uG00jzu7QsxPKxP5mTd1/bmsZD9sc58so1AKeMK
 30qzvh9xHNBk+FO5tCuXQnUklvSjPQ2gP6uqpFe6eP0eMQZL5v20OIJSsFffs6kQnbiI
 PVi/MTmZsaJeH0nUBewnhav1kw866qjG2jlfcYKFa1y0gYNJGl/0weNXcf0/uEZPS4m2
 3neOtADYELS3wxEwkZZvINbE3I5fNb3+Cmih3fKKD13G9N5Kcnc5xWyAvOZKzqZIYoet
 m2Bc9I+8RhlKv6RIiNTN1fXI0fLkPBzVgwQr9FoXr+n9P/MlFv4NSXpYi9ccxVq7PqdH
 ys2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=2mrsdnvD8wyDjJzaLu44gItX8Fn98lAu0yzczJuLApQ=;
 fh=VntcOgbegSGBtS0sD75bbYKcJGhrjSd0CPwM4oZp1YQ=;
 b=D99dF9DouML9rJB/DULBd68hGpKGRIP56c8WWGOg0zfHf0GnHlMZBB7WWG2T/UH7vP
 6gWw/Gko9PrzORhdRrut/J/ZjHmokd0x2RLpqVtzTcH3yuSj9n7DwVus0cFncPYByeVL
 zTDQ73dFEZFUw7Xr7RDykfDG2XFg8HpOwlhvs4VGYfqGPwMrMe3DSYKeViH2yulIiryy
 qVFD9jVWMiXPw7eu/6aaTFmHIS5vLpGnviYSDmC8yXRctR5I23OIqARuQZm6vPksEmwk
 6Hw1v5yeXSZN7H9YY9vJrQxdgFnweZjw9d0/IyeK9F3p2+vPNUNTXxkFidFdDUkZyqjV
 eOzw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1783491805; x=1784096605; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2mrsdnvD8wyDjJzaLu44gItX8Fn98lAu0yzczJuLApQ=;
 b=HqaPy0z3L41MHnGdaeMOCyAioRN31Y4eIKGJlLAG22r1ZqcUCjIVHumFd8jp7ddT+/
 kGIn/IHUTj+99bipqc6I9CiPDUcRdlI8NWcrBqMoESbALqQU2n0Pa5OL3XN0JRNUAimD
 Q+qyFjqKcZ1aA8f/oWluNzFZ6CQ+JnwPMYn5o9BEFgi5lOkQwlZr7zeTCOrkWZ6rXZ+w
 c2Rv+Uv7EW6n4TLffM7HsCke5FBAJaEtP0KJRaWIjJMUcSDm91gCQxHN5CX+ITJ+Nh1q
 kwSJLX5y3tcyQbajB/rtz09IcN+Kc9jrotKdYAjm+azjf3G8Z/o3O8ZB2t2FL0krZ6D6
 Zxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783491805; x=1784096605;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2mrsdnvD8wyDjJzaLu44gItX8Fn98lAu0yzczJuLApQ=;
 b=AoEZUdVj6JmIHrAfnxORKre+Lj4WDDWqBIpvEqhPgsmSf5t124ks3fxoxHQ0/VLRQw
 QXoB3lIHzJfxuIORcJRkieDocimcrwdfRYfGJpdfcpPUULxvB07I++yhLK1Rv7Uu4D4g
 9B9zogXAPET7gu7o1qOl0TyxR8TG2hbhNlpfNRNQAcdXvY9Ai1FEe9ZsNA4wbiquWaln
 6g7XzS2B9D+OYOEugIBtmrQ0N7ZXkglfuN95odhKSitGzHh6Fq+B72tvMiTnstyEYkX9
 Y/tgVdtgP1vBfgPx1+fNuOrvZCPtQnt1JBT4nr0N8wMXATM77wX8OtGva47xBLie603v
 8nYg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoxmSxwT2SPLjPeILmMiIBgfDA8UkJpkc8ejroPD8XU6pqT1cDA0EFLLmKqulUhtyKYApWtu9we@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaZ6GMt0tbicWK7IyCBWbjD13sb8dAKrOBV/O6m+u1dxNHbB+a
 Wxwkm1TXXLcEPnZ4kloRId76XaqXP+WgGiATeG6XTOQAGX24lZU0yJsEik/+m3CvmOjQYYWWNj1
 6lPEF+TTP8aF49vxtZy+tKt0Qqvk1+koI8Saf1icOgg==
X-Gm-Gg: AfdE7cnlPo4l54GxwTGOfZg73265oJM3Q7a8LnVZ1nQcLM7W+evOCV+cc5gfb+qjd0C
 5HIPCaeJab1g7oLHezgmzWpWLh+vQytNrlMsmVjzSAQ7k3FjMBZIWTV98th9lI5FhercIym1Awx
 pG4LeJ08/4vvWukdyHo5jCROLpnL10LMdlBxT+SZl51mbaAOTj6B29/UNgphX78ARDPcg/wVMIP
 jVeCeZN+otSwClMNVLAoDHjfW6rbGPq+Fkk5/+9Io/RyU6Fy4hgM7w/uszmvLVxLic+ICl8tUkz
 eCiF01Co2impixEAAgMjhFNslx4S2C+KDNsTlBRZ
X-Received: by 2002:a05:6512:838b:b0:5b0:d0d:1f41 with SMTP id
 2adb3069b0e04-5b01145dc07mr247846e87.32.1783491805462; Tue, 07 Jul 2026
 23:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260707093812.109176-1-marco.crivellari@suse.com>
 <12766042.8bMQJbFj6T@timur-max>
 <CADnq5_MHa8L9gWutwRKBQQ5QuM=5qd8eJgC8ZYKyBQQ1J9NUZQ@mail.gmail.com>
In-Reply-To: <CADnq5_MHa8L9gWutwRKBQQ5QuM=5qd8eJgC8ZYKyBQQ1J9NUZQ@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 8 Jul 2026 08:23:14 +0200
X-Gm-Features: AVVi8CeJhDw9N0PwmBetZLqNcsqmdLEyWTsa6Ck_ToyKT89sOJoqix71D3z0JWk
Message-ID: <CAAofZF6186ZO2j-pphxxW=Gg1asF03-ZhcW3Z0-kUB=q3_xm3A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Change system_unbound_wq with system_dfl_wq
To: Alex Deucher <alexdeucher@gmail.com>
Cc: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kees Cook <kees@kernel.org>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Ce Sun <cesun102@amd.com>, 
 Tao Zhou <tao.zhou1@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, 
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:timur.kristof@gmail.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:mhocko@suse.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kees@kernel.org,m:tvrtko.ursulin@igalia.com,m:cesun102@amd.com,m:tao.zhou1@amd.com,m:cascardo@igalia.com,m:Hawking.Zhang@amd.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org,kernel.org,linutronix.de,suse.com,amd.com,ffwll.ch,igalia.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51160726A99

On Tue, Jul 7, 2026 at 8:13=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com>=
 wrote:
>
> Applied.  Thanks!

Many thanks!

--=20

Marco Crivellari

SUSE Labs
