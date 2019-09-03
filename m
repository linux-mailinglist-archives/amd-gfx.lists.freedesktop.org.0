Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 643BAA632B
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 09:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9E8896EB;
	Tue,  3 Sep 2019 07:55:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9932896EC
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 07:55:54 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id f22so17622614edt.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 03 Sep 2019 00:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=AmAnl8kfE0vBI96hdeUKYAwDGENm90ZrAc9j932dkWk=;
 b=WyKofn9Yr6RpnSY5Xgc+63DHEZITB4+nKGvu7uG1XgbMWr/TxnZ3lPWb7eM5OKURbl
 HaZHagj8QalVNDl/LjvBp6PJW5J+dkSKZkzYHanICz3xlEbws7Au0wnU2K5u9wvknTyS
 geNoQLJWZEDZ7LRUqXjddU3h7tuf9+iXzClPb8E8yaQZRY6zitSIakuOm42+8R5PgFdQ
 6iCBgENP8GnAiGLBi1F72vdHmQPFbxVJjwADJglYQ7vFe1vzV6nPz1BIiWu9+pCvfsfS
 CQzm0NjLkRCTNsK5iWDou9Td0FHCJ1IoBReNCXhEQwJCs0yIzhxc3BBrbyJiTyG5d31a
 37mw==
X-Gm-Message-State: APjAAAWgOX3Ej7OefwtAr5hJfnRDq59GNwCOT3aNBTMjC+izcM3C3z8Q
 3B9UieScF91ic5PBaqoPTjOLDg==
X-Google-Smtp-Source: APXvYqy9u46WjLxxF2M4g4BWzlWEqsYbrIpLaHO40gsB5L5SjPuxVBEmsEciOorZrj9TrV4x1gUNZA==
X-Received: by 2002:a50:d903:: with SMTP id t3mr6724598edj.117.1567497353465; 
 Tue, 03 Sep 2019 00:55:53 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id q10sm2251744ejt.54.2019.09.03.00.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 00:55:52 -0700 (PDT)
Date: Tue, 3 Sep 2019 09:55:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH RFC v4 00/16] new cgroup controller for gpu/drm subsystem
Message-ID: <20190903075550.GJ2112@phenom.ffwll.local>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190831042857.GD2263813@devbig004.ftw2.facebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190831042857.GD2263813@devbig004.ftw2.facebook.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AmAnl8kfE0vBI96hdeUKYAwDGENm90ZrAc9j932dkWk=;
 b=iQMmbEKgIKuMneIbsrUBAZYlU4Mg+FeMtANYlS6Dl5ifcZg4VGyCjb1JFiQUT7btFd
 nYpM3eu6ZkxFgg+n/Io7Jn5hT5uw31/DUBhLS6ruwdTHq4AT7kihHaG/r2X3RyMstpb3
 adstYR0gjOB+q20iq8zQ+/I9/Ai1x9sYhh6Kg=
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
Cc: daniel@ffwll.ch, Kenny Ho <Kenny.Ho@amd.com>, felix.kuehling@amd.com,
 jsparks@cray.com, amd-gfx@lists.freedesktop.org, lkaplan@cray.com,
 y2kenny@gmail.com, dri-devel@lists.freedesktop.org, joseph.greathouse@amd.com,
 alexander.deucher@amd.com, cgroups@vger.kernel.org, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgMDk6Mjg6NTdQTSAtMDcwMCwgVGVqdW4gSGVvIHdyb3Rl
Ogo+IEhlbGxvLAo+IAo+IEkganVzdCBnbGFuY2VkIHRocm91Z2ggdGhlIGludGVyZmFjZSBhbmQg
ZG9uJ3QgaGF2ZSBlbm91Z2ggY29udGV4dCB0bwo+IGdpdmUgYW55IGtpbmQgb2YgZGV0YWlsZWQg
cmV2aWV3IHlldC4gIEknbGwgdHJ5IHRvIHJlYWQgdXAgYW5kCj4gdW5kZXJzdGFuZCBtb3JlIGFu
ZCB3b3VsZCBncmVhdGx5IGFwcHJlY2lhdGUgaWYgeW91IGNhbiBnaXZlIG1lIHNvbWUKPiBwb2lu
dGVycyB0byByZWFkIHVwIG9uIHRoZSByZXNvdXJjZXMgYmVpbmcgY29udHJvbGxlZCBhbmQgaG93
IHRoZQo+IGFjdHVhbCB1c2UgY2FzZXMgd291bGQgbG9vayBsaWtlLiAgVGhhdCBzYWlkLCBJIGhh
dmUgc29tZSBiYXNpYwo+IGNvbmNlcm5zLgo+IAo+ICogVFRNIHZzLiBHRU0gZGlzdGluY3Rpb24g
c2VlbXMgdG8gYmUgaW50ZXJuYWwgaW1wbGVtZW50YXRpb24gZGV0YWlsCj4gICByYXRoZXIgdGhh
biBhbnl0aGluZyByZWxhdGluZyB0byB1bmRlcmx5aW5nIHBoeXNpY2FsIHJlc291cmNlcy4KPiAg
IFByb3ZpZGVkIHRoYXQncyB0aGUgY2FzZSwgSSdtIGFmcmFpZCB0aGVzZSBpbnRlcm5hbCBjb25z
dHJ1Y3RzIGJlaW5nCj4gICB1c2VkIGFzIHByaW1hcnkgcmVzb3VyY2UgY29udHJvbCBvYmplY3Rz
IGxpa2VseSBpc24ndCB0aGUgcmlnaHQKPiAgIGFwcHJvYWNoLiAgV2hldGhlciBhIGdpdmVuIGRy
aXZlciB1c2VzIG9uZSBvciB0aGUgb3RoZXIgaW50ZXJuYWwKPiAgIGFic3RyYWN0aW9uIGxheWVy
IHNob3VsZG4ndCBkZXRlcm1pbmUgaG93IHJlc291cmNlcyBhcmUgcmVwcmVzZW50ZWQKPiAgIGF0
IHRoZSB1c2VybGFuZCBpbnRlcmZhY2UgbGF5ZXIuCgpZZWFoIHRoZXJlJ3MgYW5vdGhlciBSRkMg
c2VyaWVzIGZyb20gQnJpYW4gV2VsdHkgdG8gYWJzdHJhY3QgdGhpcyBhd2F5IGFzCmEgbWVtb3J5
IHJlZ2lvbiBjb25jZXB0IGZvciBncHVzLgoKPiAqIFdoaWxlIGJyZWFraW5nIHVwIGFuZCBhcHBs
eWluZyBjb250cm9sIHRvIGRpZmZlcmVudCB0eXBlcyBvZgo+ICAgaW50ZXJuYWwgb2JqZWN0cyBt
YXkgc2VlbSBhdHRyYWN0aXZlIHRvIGZvbGtzIHdobyB3b3JrIGRheSBpbiBhbmQKPiAgIGRheSBv
dXQgd2l0aCB0aGUgc3Vic3lzdGVtLCB0aGV5IGFyZW4ndCBhbGwgdGhhdCB1c2VmdWwgdG8gdXNl
cnMgYW5kCj4gICB0aGUgc2lsb2VkIGNvbnRyb2xzIGFyZSBsaWtlbHkgdG8gbWFrZSB0aGUgd2hv
bGUgbWVjaGFuaXNtIGEgbG90Cj4gICBsZXNzIHVzZWZ1bC4gIFdlIGhhZCB0aGUgc2FtZSBwcm9i
bGVtIHdpdGggY2dyb3VwMSBtZW1jZyAtIHB1dHRpbmcKPiAgIGNvbnRyb2wgb2YgZGlmZmVyZW50
IHVzZXMgb2YgbWVtb3J5IHVuZGVyIHNlcGFyYXRlIGtub2JzLiAgSXQgbWFkZQo+ICAgdGhlIHdo
b2xlIHRoaW5nIHByZXR0eSB1c2VsZXNzLiAgZS5nLiBpZiB5b3UgY29uc3RyYWluIGFsbCBrbm9i
cwo+ICAgdGlnaHQgZW5vdWdoIHRvIGNvbnRyb2wgdGhlIG92ZXJhbGwgdXNhZ2UsIG92ZXJhbGwg
dXRpbGl6YXRpb24KPiAgIHN1ZmZlcnMsIGJ1dCBpZiB5b3UgZG9uJ3QsIHlvdSByZWFsbHkgZG9u
J3QgaGF2ZSBjb250cm9sIG92ZXIgYWN0dWFsCj4gICB1c2FnZS4gIEZvciBtZW1jZywgd2hhdCBo
YXMgdG8gYmUgYWxsb2NhdGVkIGFuZCBjb250cm9sbGVkIGlzCj4gICBwaHlzaWNhbCBtZW1vcnks
IG5vIG1hdHRlciBob3cgdGhleSdyZSB1c2VkLiAgSXQncyBub3QgbGlrZSB5b3UgY2FuCj4gICBn
byBidXkgbW9yZSAic29ja2V0IiBtZW1vcnkuICBBdCBsZWFzdCBmcm9tIHRoZSBsb29rcyBvZiBp
dCwgSSdtCj4gICBhZnJhaWQgZ3B1IGNvbnRyb2xsZXIgaXMgcmVwZWF0aW5nIHRoZSBzYW1lIG1p
c3Rha2VzLgoKV2UgZG8gaGF2ZSBxdWl0ZSBhIHBpbGUgb2YgZGlmZmVyZW50IG1lbW9yaWVzIGFu
ZCByYW5nZXMsIHNvIEkgZG9uJ3QKdGhpbmt0IHdlJ3JlIGRvaW5nIHRoZSBzYW1lIG1pc3Rha2Ug
aGVyZS4gQnV0IGl0IGlzIG1heWJlIGEgYml0IHRvbwpjb21wbGljYXRlZCwgYW5kIGV4cG9zZXMg
c3R1ZmYgdGhhdCBtb3N0IHVzZXJzIHJlYWxseSBkb24ndCBjYXJlIGFib3V0LgotRGFuaWVsCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
