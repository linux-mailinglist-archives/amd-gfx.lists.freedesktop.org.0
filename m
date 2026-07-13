Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RhIQHPFQVWowmwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 22:56:17 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB86A74F26E
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 22:56:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Y2Axs5GZ;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6129C10EB05;
	Mon, 13 Jul 2026 20:56:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2391610EB05
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 20:56:14 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-384422b05b5so485503a91.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 13:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783976174; cv=none;
 d=google.com; s=arc-20260327;
 b=RHv4W/HFEl7kyIRcs8vOK+fTX3vib9nEsJF3bOmtozG4O47eN5d3HWX6UnIlGrqoFc
 gtBgJ+ImK9JPo9MD9hNCghdU9BaAEYNpgm8IeZvOSwIxkDBlebclv8VQsf1pU+za8ve9
 BvAiVECaJ1POLvdNpTM4IjZCPnERMV4lZTsA5L3vYo5al0tcFROl4QeSmedhybC7EKTS
 /CEWdqXUh67YsYCOMWG1biqcwyNsJ/Q5/uMjqoKjOCIPLNhLEfI47QFoOZE9E26N/E/x
 PHskdsL53+jqgfOl0IY1cyWtCuejmGz/3TzEHX54vlJMwQCMVV9cFrT+awYEoonGPBPC
 AEPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fajXqVgz7OtsY2/oFKVs+Ln5ikrq9xiAp7QF7oNhba4=;
 fh=zstBaiSMH6WYsp9IH0Bv+J7puqafAY6xfrHq3jiY1Mw=;
 b=pztYn5EqWEMBjKP7V9YGyLvYKj8kmlmSHLj/N3hswLKeKJxutyNirJAkMNqMQoTWYL
 WVCyrzgzIJ4a91oDi3Etfk4faWpI9SRjR9of77+9ZpjAaPlYeUgkayR/gnUy5kSkt2s/
 ZCZg3OzZl1YxY9HOOavcLphwgz6ypOsfdhG/1+/Fsq/YW90Gp+iDip1jPQBqbtk6xZZp
 b1swqDxQIvbANa+WgS/4Hf2fAlCxsPVnfcDyjPanpDm/5alUIZXSengIdhjrUUYsig/U
 c5QsY0JsyKK5+RXmi3HqtH7LBevy4sTNFn8kcKSfYnvuwVpR9Sd/cpMMPmxcNOdclvzW
 EF4w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783976174; x=1784580974; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fajXqVgz7OtsY2/oFKVs+Ln5ikrq9xiAp7QF7oNhba4=;
 b=Y2Axs5GZ+uWXb3bA0Ec4lyuyve68x3OWOa3JLuIrX5W8UWSyUjzEJzfeAmIBLZ4z0W
 jvWSE7C05GYIIX3/nZjbyQ41aACanCfivt7JWb84RReUZqTGC3/zy42qgrkgYj9WlwUQ
 I0VnO9YLxhAu49aU/8K02aS7DRNhu4WLlLdD1mv5PUSGII3YPdtNZYzlBhePDB0qzL7u
 Yqc9/mz8zG5YyYVggxo/eaATAG2RtNKdPuozWuDzwU7DG8sWvb2ZqoNwvniuexWtRjMa
 8PisD0Xl2ge5EnesAR2YeK1xXirqjvGrH9Kp0UzXhyzWBZi1NFRctgcZIM2C+oshkh8I
 o6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783976174; x=1784580974;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fajXqVgz7OtsY2/oFKVs+Ln5ikrq9xiAp7QF7oNhba4=;
 b=FnhFvxLotJ3OReAEc9FZpfC4qV9ww/F808nDgj0AjHrojBi5MiwYI/1lf8aeMHR/HJ
 fy4gPbMa6UF2QPTdcTOaRw5dzRmQGqkmayZOwRmQPqNlTnqd4miVJ67+4CBuwctY6RDs
 IcwC7D/65jLa4oZLfQ/JCGzAysbogr/ryxdgygwzBHH+w2iFigSTNEe8U1BzumnXVySl
 QRrYSFCTwNp0A+hupL8/vEIUIm+XXeRX/I3jJAXn2KuaKRJNACtu1p7OB2Qf80EFzN93
 2qRmsiQL2fX/3QemX6SsGdA9BuDVm7hLIO1r7gIn6QT7i8X84V5/Vi64txoHCIZO2fwu
 VMiA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqKnGgpHV3qPQrWjszu0KdEGZlTfK8MpSKs9p0jT4c4+5Jud6pkL75nOQVyx3Rg0gW3JW460rUc@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZ/nah546v6de0qX5UGIVXpG4KwyyHU58iijGJUB7hG32x+XCG
 hMttRLHLIXTrh1aHmb+1vUmoXOBhoNbPlqGAiY7ts4phZ36mWeVcBojkskxMbXmhXQqfgL17F9H
 Y3d9Vj6kOpnY0XSKZ0CKHQnzbZuXmmEk=
X-Gm-Gg: AfdE7ckEKQjUAzwDEKQYeKjeB99Rzi+Ta708T4zdD2pNeQHuk8bXneQZdf4uQZc+qN6
 0P07F/vllYmJ+L+CFgXXz7XTe7o4rJc5YZgFINHKWbbN9cxo7thASr017kLYdbEv1u+a5scDnVe
 w2tMQg60dqte1CCqHV4wt4+/EK+gvWArZPpBX31IY9B4CFWD72MUWyeog0yRmnlB0tQZ+vgvtO/
 HldSBldK4IqdrYxPcnz5sddJCz5oi849zgRuqL4PPTqBsyRzHRdLHTd2sXgstqZztVK/Do79CUs
 c9aDJKH8UlNAAjLdT+rRL9L213HbU2OJh3D1OdW+xtlzCuFh9Je6fJMw8hA=
X-Received: by 2002:a17:90b:2d4e:b0:368:b002:bdad with SMTP id
 98e67ed59e1d1-38dc779df28mr7286066a91.5.1783976173692; Mon, 13 Jul 2026
 13:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260713164321.3350036-1-srinivasan.shanmugam@amd.com>
 <20260713164321.3350036-2-srinivasan.shanmugam@amd.com>
In-Reply-To: <20260713164321.3350036-2-srinivasan.shanmugam@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Jul 2026 16:56:01 -0400
X-Gm-Features: AVVi8CfNW8x4tgbqA4RFD87MXhpLKhL9k-7GDXQ6sFf6C5UVSW3TMOD-LNYxMU0
Message-ID: <CADnq5_OY0a2xD-TN+zCc7gRbVVVXuOuF_4LduNYkWv4G0h1FfA@mail.gmail.com>
Subject: Re: [PATCH v8 1/6] drm/amdgpu/uapi: Add WAIT_EVENT ioctl and metadata
 structures
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:srinivasan.shanmugam@amd.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB86A74F26E

On Mon, Jul 13, 2026 at 12:54=E2=80=AFPM Srinivasan Shanmugam
<srinivasan.shanmugam@amd.com> wrote:
>
> Add the UAPI definitions for a render-node WAIT_EVENT ioctl.
>
> WAIT_EVENT lets userspace wait for a kernel-defined event type and
> receive metadata describing the event. This provides the
> metadata-carrying half of the event interface and is kept separate from
> EVENTFD, which is used only for lightweight readiness notification.
>
> The new UAPI supports:
>
>  - event type selection
>  - queue-scoped or GPU-scoped event selection
>  - timeout-based waiting
>  - metadata copy to userspace
>  - single-consumer delivery of the first matching event
>
> queue_id is a userspace queue handle used at the ioctl boundary and in
> returned metadata for queue-scoped events.

You should mention that this is the queue handle used for userqs.  It
corresponds to a queue created via the drm_amdgpu_userq IOCTL.  Other
than that, looks good to me.

Alex

>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> ---
>  include/uapi/drm/amdgpu_drm.h | 103 ++++++++++++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)
>
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.=
h
> index bbda6ffc498b..8b6fddb43e86 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -61,6 +61,7 @@ extern "C" {
>  #define DRM_AMDGPU_PROC_OPTIONS                0x1A
>  #define DRM_AMDGPU_CWSR                        0x1B
>  #define DRM_AMDGPU_EVENTFD             0x1C
> +#define DRM_AMDGPU_WAIT_EVENT  0x1D
>
>  #define DRM_IOCTL_AMDGPU_GEM_CREATE    DRM_IOWR(DRM_COMMAND_BASE + DRM_A=
MDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>  #define DRM_IOCTL_AMDGPU_GEM_MMAP      DRM_IOWR(DRM_COMMAND_BASE + DRM_A=
MDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
> @@ -86,6 +87,8 @@ extern "C" {
>  #define DRM_IOCTL_AMDGPU_CWSR  DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CW=
SR, union drm_amdgpu_cwsr)
>  #define DRM_IOCTL_AMDGPU_EVENTFD \
>         DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_EVENTFD, struct drm_amdgpu_=
eventfd)
> +#define DRM_IOCTL_AMDGPU_WAIT_EVENT \
> +       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_WAIT_EVENT, struct drm_amd=
gpu_wait_event)
>
>  /**
>   * DOC: memory domains
> @@ -251,6 +254,106 @@ struct drm_amdgpu_eventfd {
>         __u32 flags;
>  };
>
> +/**
> + * struct drm_amdgpu_wait_event_queue - queue-scoped event metadata
> + * @queue_id: userspace queue handle
> + * @status: event-specific status or error code
> + * @data0: event-specific payload
> + * @data1: event-specific payload
> + */
> +struct drm_amdgpu_wait_event_queue {
> +       __u32 queue_id;
> +       __u32 status;
> +       __u64 data0;
> +       __u64 data1;
> +};
> +
> +/**
> + * struct drm_amdgpu_wait_event_memory - memory exception metadata
> + * @queue_id: userspace queue handle if applicable, else 0
> + * @fault_status: device-specific fault or exception status
> + * @va: faulting virtual address if applicable
> + * @data0: event-specific payload
> + */
> +struct drm_amdgpu_wait_event_memory {
> +       __u32 queue_id;
> +       __u32 fault_status;
> +       __u64 va;
> +       __u64 data0;
> +};
> +
> +/**
> + * struct drm_amdgpu_wait_event_reset - reset metadata
> + * @queue_id: userspace queue handle if queue-scoped, else 0
> + * @reset_cause: reset cause or reason code
> + * @data0: event-specific payload
> + * @data1: event-specific payload
> + */
> +struct drm_amdgpu_wait_event_reset {
> +       __u32 queue_id;
> +       __u32 reset_cause;
> +       __u64 data0;
> +       __u64 data1;
> +};
> +
> +/**
> + * struct drm_amdgpu_wait_event_scratch - scratch event metadata
> + * @queue_id: userspace queue handle
> + * @error_code: scratch-related error code
> + * @requested_bytes: requested scratch size
> + * @available_bytes: available scratch size if known
> + */
> +struct drm_amdgpu_wait_event_scratch {
> +       __u32 queue_id;
> +       __u32 error_code;
> +       __u64 requested_bytes;
> +       __u64 available_bytes;
> +};
> +
> +/**
> + * struct drm_amdgpu_wait_event_data - returned event record
> + * @event_type: kernel-defined event type
> + * @queue_id: userspace queue handle, or 0 for GPU-scoped events
> + * @flags: reserved, must be 0
> + * @reserved: reserved, must be 0
> + * @seqno: per-file event sequence number
> + * @u: event-specific metadata
> + */
> +struct drm_amdgpu_wait_event_data {
> +       __u32 event_type;
> +       __u32 queue_id;
> +       __u32 flags;
> +       __u32 reserved;
> +       __u64 seqno;
> +       union {
> +               struct drm_amdgpu_wait_event_queue queue;
> +               struct drm_amdgpu_wait_event_memory memory;
> +               struct drm_amdgpu_wait_event_reset reset;
> +               struct drm_amdgpu_wait_event_scratch scratch;
> +       } u;
> +};
> +
> +/**
> + * struct drm_amdgpu_wait_event - wait for a render-node event
> + * @event_type: kernel-defined event type
> + * @queue_id: userspace queue handle for queue-scoped events, 0 for GPU-=
scoped events
> + * @timeout_ns: relative timeout in nanoseconds; negative means wait for=
ever
> + * @out_ptr: userspace pointer to struct drm_amdgpu_wait_event_data
> + * @out_size: size of userspace output buffer
> + * @flags: must be 0
> + *
> + * Wait for the selected event and copy the first matching event record =
to
> + * userspace. Matching records are consumed by a single waiter.
> + */
> +struct drm_amdgpu_wait_event {
> +       __u32 event_type;
> +       __u32 queue_id;
> +       __s64 timeout_ns;
> +       __u64 out_ptr;
> +       __u32 out_size;
> +       __u32 flags;
> +};
> +
>  /** Opcode to create new residency list.  */
>  #define AMDGPU_BO_LIST_OP_CREATE       0
>  /** Opcode to destroy previously created residency list */
> --
> 2.34.1
>
