Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B57CBA56
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 14:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54F86EB65;
	Fri,  4 Oct 2019 12:24:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F6B6EB4B
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 11:36:33 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id c3so1545590plo.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 04 Oct 2019 04:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nOCYZTp0wlW16jrmBzFl+zhQm0PaZWf4IPrpoghz8Yo=;
 b=nx6bVd4T3ibdW85CgihNzeV+jD2DwjWR8S4QiUZrT/MIgC/QIdktuRX6CI2WqakG3A
 AtdK6HK42DPcHqpe0ptRd+RoEAQbBdWnne4YADmeDl0lezdw474MstxHajHQO1uxjt16
 mJ+2Em4qtajnSg91aRGLWhzgcOiATXTxzPly3pJumx7iVDc5iDxPncby11UA/AkAnj67
 3RdMZbzRMQwieLtCFrCVtvbaFSACEmcS9jUsnOEu+Tte236iDsM5f+3mZpLW8ilQCI0f
 CiDfscxvumJRZ6mN2oOBo4LRuAY/Oz9nykH31DWcuQlhTmvekOQQIQZKHe/AvdZD5Zf8
 LbKw==
X-Gm-Message-State: APjAAAXogsTZBru1v/NJmpIm/4xrFiXJs1LuF0uu0KF8GERbjxiNOWZp
 r8cXMcaZNtoWbxnpMN1fPDqZKA==
X-Google-Smtp-Source: APXvYqycHeOHIdMYTzA5mukhrOH4bcwhg8D6NWJcmxV+oLSJ8CZYEOinQHT3+LzyKtJ5O8kGHo7eRg==
X-Received: by 2002:a17:902:6b4c:: with SMTP id
 g12mr15170702plt.80.1570188992416; 
 Fri, 04 Oct 2019 04:36:32 -0700 (PDT)
Received: from google.com ([2620:15c:2cd:202:668d:6035:b425:3a3a])
 by smtp.gmail.com with ESMTPSA id ev20sm5730991pjb.19.2019.10.04.04.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 04:36:30 -0700 (PDT)
Date: Fri, 4 Oct 2019 04:36:28 -0700
From: Michel Lespinasse <walken@google.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 03/11] drm/amdgpu: convert amdgpu_vm_it to half closed
 intervals
Message-ID: <20191004113628.GA260828@google.com>
References: <20191003201858.11666-1-dave@stgolabs.net>
 <20191003201858.11666-4-dave@stgolabs.net>
 <dc9cc8c4-7275-43be-5bed-91384e3246ae@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc9cc8c4-7275-43be-5bed-91384e3246ae@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 04 Oct 2019 12:24:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nOCYZTp0wlW16jrmBzFl+zhQm0PaZWf4IPrpoghz8Yo=;
 b=K+HIkB/DaYwobnDZtGi3XYvBspVWPMRJiBUETqqpwYTvQp9tFBZOt4UE5me6R4KH5S
 Mpx9ZDpyd8o1w0mVzmm8xGfSJnTlB+fk7/XqioTy3S4hbK3Z5kH0ZqyrjIOzsB8/tH4D
 pfUcTKQjyTZzSqwORuc9ZViuQQAwesVIU9ynZ29agbbAhvnjEeoO4Q3XkX0ZgukyrWyx
 OlvSrz0HxL/0J8NRos64LcHFpCF7MEyzvjVw1ZWrt38q+v1BvfwltyrXUM8IdBp68K2O
 qjUllfapLPCmx63lB2GJHG7VgeZVpYLRyL6TEoYakOevapQZBNzNwj6pu5yuCvW2iDrV
 mrHQ==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Davidlohr Bueso <dbueso@suse.de>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDY6NTQ6NTRBTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gQW0gMDMuMTAuMTkgdW0gMjI6MTggc2NocmllYiBEYXZpZGxvaHIgQnVlc286
Cj4gPiBUaGUgYW1kZ3B1X3ZtIGludGVydmFsIHRyZWUgcmVhbGx5IHdhbnRzIFthLCBiKSBpbnRl
cnZhbHMsCj4gCj4gTkFLLCB3ZSBleHBsaWNpdGx5IGRvIG5lZWQgYW4gW2EsIGJbIGludGVydmFs
IGhlcmUuCgpIaSBDaHJpc3RpYW4sCgpKdXN0IHdhbnRlZCB0byBjb25maXJtIHdoZXJlIHlvdSBz
dGFuZCBvbiB0aGlzIHBhdGNoLCBzaW5jZSBJIHRoaW5rCnlvdSByZWNvbnNpZGVyZWQgeW91ciBp
bml0aWFsIHBvc2l0aW9uIGFmdGVyIGZpcnN0IGxvb2tpbmcgYXQgOS8xMQpmcm9tIHRoaXMgc2Vy
aWVzLgoKSSBkbyBub3Qga25vdyB0aGUgYW1kZ3B1IGNvZGUgd2VsbCwgYnV0IEkgdGhpbmsgdGhl
IGNoYW5nZXMgc2hvdWxkIGJlCmZpbmUgLSBpbiBzdHJ1Y3QgYW1kZ3B1X2JvX3ZhX21hcHBpbmcs
IHRoZSAiZW5kIiBmaWVsZCB3aWxsIGhvbGQgd2hhdAp3YXMgcHJldmlvdXNseSBzdG9yZWQgaW4g
dGhlICJsYXN0IiBmaWVsZCwgcGx1cyBvbmUuIFRoZSBleHBlY3RhdGlvbgppcyB0aGF0IG92ZXJm
bG93cyBzaG91bGQgbm90IGJlIGFuIGlzc3VlIHRoZXJlLCBhcyAiZW5kIiBpcyBleHBsaWNpdGx5
CmRlY2xhcmVkIGFzIGFuIHVpbnQ2NCwgYW5kIGFzIHRoZSBjb2RlIHdhcyBwcmV2aW91c2x5IGNv
bXB1dGluZwoibGFzdCArIDEiIGluIG1hbnkgcGxhY2VzLgoKRG9lcyB0aGF0IHNlZW0gd29ya2Fi
bGUgdG8geW91ID8KClRoYW5rcywKCi0tIApNaWNoZWwgIldhbGtlbiIgTGVzcGluYXNzZQpBIHBy
b2dyYW0gaXMgbmV2ZXIgZnVsbHkgZGVidWdnZWQgdW50aWwgdGhlIGxhc3QgdXNlciBkaWVzLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
