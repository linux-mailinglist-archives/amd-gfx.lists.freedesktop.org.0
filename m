Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5971EDF70
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jun 2020 10:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953A26E317;
	Thu,  4 Jun 2020 08:12:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A1E899E9
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jun 2020 08:12:55 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y17so5015090wrn.11
 for <amd-gfx@lists.freedesktop.org>; Thu, 04 Jun 2020 01:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xBHH8HV/ynkGTblaQCBVPIasEigLpWOOzD+/aDDngeE=;
 b=hFJHKrGcuuTLGVLvJHPMkbscDyUX8o+8t48i8gjHX/wrNO8TtoqmHu26IkBnYNObr4
 KrI3LjBc0l2LHjqOn1T5MjPDcrAq4+mlQUnp02d+7XQ707QBLNKeZkrBDQuMdNYSE4rB
 ZVSbprOpIkob9k4ZgEk5Bvg5TCd7X96OYidgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xBHH8HV/ynkGTblaQCBVPIasEigLpWOOzD+/aDDngeE=;
 b=AJnrxEiZMzrnrZUTMO21YY/JRC4J8xdxU2j3gu4GcSxh07Bu2ZZcLWaFF+UIMtKw46
 ccUIq1E4sli2WU85uxG9CHo2ocpwEKCrkeft6lxM+RWOUtTIFDSEdtcuNSZCYnE3BRjN
 YtDhPGeZMdLajK6OCXHPwhX56BbtW4wy3iyvI3NUFqVbW3K1iE5hRhL0K0fccGe0fW5Y
 JphtRPfXJySm/cgFTx3X/Uv7Tp6WciJF6rfBoX7hcPRkcc7goL/D8QDN6UIvWjXtykR+
 eAoAzB68kVchgD+HCXPZPv/WiMLVaq8YuL5v40zi2/HUR+J3LpCDMeXPwZuR5TUn7Mlz
 XeBA==
X-Gm-Message-State: AOAM5307XqCaR9pxi0bsbuMhM2026ycj6pXvc+0gALZ39SYxJbj3qcxe
 e/PJDh0ijdlMG91ZpKvfgK1xcA==
X-Google-Smtp-Source: ABdhPJyObyzep5ImU/AAS5w8hAKuTWNCEAJ1espIeo8JSFze8n8cPO+9cK+VeTUgMxSDryXkAOC4zw==
X-Received: by 2002:adf:a4dd:: with SMTP id h29mr3422543wrb.372.1591258373746; 
 Thu, 04 Jun 2020 01:12:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f11sm6873305wrj.2.2020.06.04.01.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 01:12:53 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 17/18] drm/amdgpu: gpu recovery does full modesets
Date: Thu,  4 Jun 2020 10:12:23 +0200
Message-Id: <20200604081224.863494-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Li4uCgpJIHRoaW5rIGl0J3MgdGltZSB0byBzdG9wIHRoaXMgbGl0dGxlIGV4ZXJjaXNlLgoKVGhl
IGxvY2tkZXAgc3BsYXQsIGZvciB0aGUgcmVjb3JkOgoKWyAgMTMyLjU4MzM4MV0gPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09ClsgIDEzMi41ODQw
OTFdIFdBUk5JTkc6IHBvc3NpYmxlIGNpcmN1bGFyIGxvY2tpbmcgZGVwZW5kZW5jeSBkZXRlY3Rl
ZApbICAxMzIuNTg0Nzc1XSA1LjcuMC1yYzMrICMzNDYgVGFpbnRlZDogRyAgICAgICAgVwpbICAx
MzIuNTg1NDYxXSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KWyAgMTMyLjU4NjE4NF0ga3dvcmtlci8yOjMvODY1IGlzIHRyeWluZyB0byBhY3F1
aXJlIGxvY2s6ClsgIDEzMi41ODY4NTddIGZmZmZjOTAwMDA2NzdjNzAgKGNydGNfd3dfY2xhc3Nf
YWNxdWlyZSl7Ky4rLn0tezA6MH0sIGF0OiBkcm1fYXRvbWljX2hlbHBlcl9zdXNwZW5kKzB4Mzgv
MHgxMjAgW2RybV9rbXNfaGVscGVyXQpbICAxMzIuNTg3NTY5XQogICAgICAgICAgICAgICBidXQg
dGFzayBpcyBhbHJlYWR5IGhvbGRpbmcgbG9jazoKWyAgMTMyLjU4OTA0NF0gZmZmZmZmZmY4MjMx
OGM4MCAoZG1hX2ZlbmNlX21hcCl7KysrK30tezA6MH0sIGF0OiBkcm1fc2NoZWRfam9iX3RpbWVk
b3V0KzB4MjUvMHhmMCBbZ3B1X3NjaGVkXQpbICAxMzIuNTg5ODAzXQogICAgICAgICAgICAgICB3
aGljaCBsb2NrIGFscmVhZHkgZGVwZW5kcyBvbiB0aGUgbmV3IGxvY2suCgpbICAxMzIuNTkyMDA5
XQogICAgICAgICAgICAgICB0aGUgZXhpc3RpbmcgZGVwZW5kZW5jeSBjaGFpbiAoaW4gcmV2ZXJz
ZSBvcmRlcikgaXM6ClsgIDEzMi41OTM1MDddCiAgICAgICAgICAgICAgIC0+ICMyIChkbWFfZmVu
Y2VfbWFwKXsrKysrfS17MDowfToKWyAgMTMyLjU5NTAxOV0gICAgICAgIGRtYV9mZW5jZV9iZWdp
bl9zaWduYWxsaW5nKzB4NTAvMHg2MApbICAxMzIuNTk1NzY3XSAgICAgICAgZHJtX2F0b21pY19o
ZWxwZXJfY29tbWl0KzB4YTEvMHgxODAgW2RybV9rbXNfaGVscGVyXQpbICAxMzIuNTk2NTY3XSAg
ICAgICAgZHJtX2NsaWVudF9tb2Rlc2V0X2NvbW1pdF9hdG9taWMrMHgxZWEvMHgyNTAgW2RybV0K
WyAgMTMyLjU5NzQyMF0gICAgICAgIGRybV9jbGllbnRfbW9kZXNldF9jb21taXRfbG9ja2VkKzB4
NTUvMHgxOTAgW2RybV0KWyAgMTMyLjU5ODE3OF0gICAgICAgIGRybV9jbGllbnRfbW9kZXNldF9j
b21taXQrMHgyNC8weDQwIFtkcm1dClsgIDEzMi41OTg5NDhdICAgICAgICBkcm1fZmJfaGVscGVy
X3Jlc3RvcmVfZmJkZXZfbW9kZV91bmxvY2tlZCsweDRiLzB4YTAgW2RybV9rbXNfaGVscGVyXQpb
ICAxMzIuNTk5NzM4XSAgICAgICAgZHJtX2ZiX2hlbHBlcl9zZXRfcGFyKzB4MzAvMHg0MCBbZHJt
X2ttc19oZWxwZXJdClsgIDEzMi42MDA1MzldICAgICAgICBmYmNvbl9pbml0KzB4MmU4LzB4NjYw
ClsgIDEzMi42MDEzNDRdICAgICAgICB2aXN1YWxfaW5pdCsweGNlLzB4MTMwClsgIDEzMi42MDIx
NTZdICAgICAgICBkb19iaW5kX2Nvbl9kcml2ZXIrMHgxYmMvMHgyYjAKWyAgMTMyLjYwMjk3MF0g
ICAgICAgIGRvX3Rha2Vfb3Zlcl9jb25zb2xlKzB4MTE1LzB4MTgwClsgIDEzMi42MDM3NjNdICAg
ICAgICBkb19mYmNvbl90YWtlb3ZlcisweDU4LzB4YjAKWyAgMTMyLjYwNDU2NF0gICAgICAgIHJl
Z2lzdGVyX2ZyYW1lYnVmZmVyKzB4MWVlLzB4MzAwClsgIDEzMi42MDUzNjldICAgICAgICBfX2Ry
bV9mYl9oZWxwZXJfaW5pdGlhbF9jb25maWdfYW5kX3VubG9jaysweDM2ZS8weDUyMCBbZHJtX2tt
c19oZWxwZXJdClsgIDEzMi42MDYxODddICAgICAgICBhbWRncHVfZmJkZXZfaW5pdCsweGIzLzB4
ZjAgW2FtZGdwdV0KWyAgMTMyLjYwNzAzMl0gICAgICAgIGFtZGdwdV9kZXZpY2VfaW5pdC5jb2xk
KzB4ZTkwLzB4MTY3NyBbYW1kZ3B1XQpbICAxMzIuNjA3ODYyXSAgICAgICAgYW1kZ3B1X2RyaXZl
cl9sb2FkX2ttcysweDVhLzB4MjAwIFthbWRncHVdClsgIDEzMi42MDg2OTddICAgICAgICBhbWRn
cHVfcGNpX3Byb2JlKzB4ZjcvMHgxODAgW2FtZGdwdV0KWyAgMTMyLjYwOTUxMV0gICAgICAgIGxv
Y2FsX3BjaV9wcm9iZSsweDQyLzB4ODAKWyAgMTMyLjYxMDMyNF0gICAgICAgIHBjaV9kZXZpY2Vf
cHJvYmUrMHgxMDQvMHgxYTAKWyAgMTMyLjYxMTEzMF0gICAgICAgIHJlYWxseV9wcm9iZSsweDE0
Ny8weDNjMApbICAxMzIuNjExOTM5XSAgICAgICAgZHJpdmVyX3Byb2JlX2RldmljZSsweGI2LzB4
MTAwClsgIDEzMi42MTI3NjZdICAgICAgICBkZXZpY2VfZHJpdmVyX2F0dGFjaCsweDUzLzB4NjAK
WyAgMTMyLjYxMzU5M10gICAgICAgIF9fZHJpdmVyX2F0dGFjaCsweDhjLzB4MTUwClsgIDEzMi42
MTQ0MTldICAgICAgICBidXNfZm9yX2VhY2hfZGV2KzB4N2IvMHhjMApbICAxMzIuNjE1MjQ5XSAg
ICAgICAgYnVzX2FkZF9kcml2ZXIrMHgxNGMvMHgxZjAKWyAgMTMyLjYxNjA3MV0gICAgICAgIGRy
aXZlcl9yZWdpc3RlcisweDZjLzB4YzAKWyAgMTMyLjYxNjkwMl0gICAgICAgIGRvX29uZV9pbml0
Y2FsbCsweDVkLzB4MmYwClsgIDEzMi42MTc3MzFdICAgICAgICBkb19pbml0X21vZHVsZSsweDVj
LzB4MjMwClsgIDEzMi42MTg1NjBdICAgICAgICBsb2FkX21vZHVsZSsweDI5ODEvMHgyYmMwClsg
IDEzMi42MTkzOTFdICAgICAgICBfX2RvX3N5c19maW5pdF9tb2R1bGUrMHhhYS8weDExMApbICAx
MzIuNjIwMjI4XSAgICAgICAgZG9fc3lzY2FsbF82NCsweDVhLzB4MjUwClsgIDEzMi42MjEwNjRd
ICAgICAgICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0OS8weGIzClsgIDEzMi42
MjE5MDNdCiAgICAgICAgICAgICAgIC0+ICMxIChjcnRjX3d3X2NsYXNzX211dGV4KXsrLisufS17
MzozfToKWyAgMTMyLjYyMzU4N10gICAgICAgIF9fd3dfbXV0ZXhfbG9jay5jb25zdHByb3AuMCsw
eGNjLzB4MTBjMApbICAxMzIuNjI0NDQ4XSAgICAgICAgd3dfbXV0ZXhfbG9jaysweDQzLzB4YjAK
WyAgMTMyLjYyNTMxNV0gICAgICAgIGRybV9tb2Rlc2V0X2xvY2srMHg0NC8weDEyMCBbZHJtXQpb
ICAxMzIuNjI2MTg0XSAgICAgICAgZHJtbV9tb2RlX2NvbmZpZ19pbml0KzB4MmRiLzB4OGIwIFtk
cm1dClsgIDEzMi42MjcwOThdICAgICAgICBhbWRncHVfZGV2aWNlX2luaXQuY29sZCsweGJkMS8w
eDE2NzcgW2FtZGdwdV0KWyAgMTMyLjYyODAwN10gICAgICAgIGFtZGdwdV9kcml2ZXJfbG9hZF9r
bXMrMHg1YS8weDIwMCBbYW1kZ3B1XQpbICAxMzIuNjI4OTIwXSAgICAgICAgYW1kZ3B1X3BjaV9w
cm9iZSsweGY3LzB4MTgwIFthbWRncHVdClsgIDEzMi42Mjk4MDRdICAgICAgICBsb2NhbF9wY2lf
cHJvYmUrMHg0Mi8weDgwClsgIDEzMi42MzA2OTBdICAgICAgICBwY2lfZGV2aWNlX3Byb2JlKzB4
MTA0LzB4MWEwClsgIDEzMi42MzE1ODNdICAgICAgICByZWFsbHlfcHJvYmUrMHgxNDcvMHgzYzAK
WyAgMTMyLjYzMjQ3OV0gICAgICAgIGRyaXZlcl9wcm9iZV9kZXZpY2UrMHhiNi8weDEwMApbICAx
MzIuNjMzMzc5XSAgICAgICAgZGV2aWNlX2RyaXZlcl9hdHRhY2grMHg1My8weDYwClsgIDEzMi42
MzQyNzVdICAgICAgICBfX2RyaXZlcl9hdHRhY2grMHg4Yy8weDE1MApbICAxMzIuNjM1MTcwXSAg
ICAgICAgYnVzX2Zvcl9lYWNoX2RldisweDdiLzB4YzAKWyAgMTMyLjYzNjA2OV0gICAgICAgIGJ1
c19hZGRfZHJpdmVyKzB4MTRjLzB4MWYwClsgIDEzMi42MzY5NzRdICAgICAgICBkcml2ZXJfcmVn
aXN0ZXIrMHg2Yy8weGMwClsgIDEzMi42Mzc4NzBdICAgICAgICBkb19vbmVfaW5pdGNhbGwrMHg1
ZC8weDJmMApbICAxMzIuNjM4NzY1XSAgICAgICAgZG9faW5pdF9tb2R1bGUrMHg1Yy8weDIzMApb
ICAxMzIuNjM5NjU0XSAgICAgICAgbG9hZF9tb2R1bGUrMHgyOTgxLzB4MmJjMApbICAxMzIuNjQw
NTIyXSAgICAgICAgX19kb19zeXNfZmluaXRfbW9kdWxlKzB4YWEvMHgxMTAKWyAgMTMyLjY0MTM3
Ml0gICAgICAgIGRvX3N5c2NhbGxfNjQrMHg1YS8weDI1MApbICAxMzIuNjQyMjAzXSAgICAgICAg
ZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDkvMHhiMwpbICAxMzIuNjQzMDIyXQog
ICAgICAgICAgICAgICAtPiAjMCAoY3J0Y193d19jbGFzc19hY3F1aXJlKXsrLisufS17MDowfToK
WyAgMTMyLjY0NDY0M10gICAgICAgIF9fbG9ja19hY3F1aXJlKzB4MTI0MS8weDIzZjAKWyAgMTMy
LjY0NTQ2OV0gICAgICAgIGxvY2tfYWNxdWlyZSsweGFkLzB4MzcwClsgIDEzMi42NDYyNzRdICAg
ICAgICBkcm1fbW9kZXNldF9hY3F1aXJlX2luaXQrMHhkMi8weDEwMCBbZHJtXQpbICAxMzIuNjQ3
MDcxXSAgICAgICAgZHJtX2F0b21pY19oZWxwZXJfc3VzcGVuZCsweDM4LzB4MTIwIFtkcm1fa21z
X2hlbHBlcl0KWyAgMTMyLjY0NzkwMl0gICAgICAgIGRtX3N1c3BlbmQrMHgxYy8weDYwIFthbWRn
cHVdClsgIDEzMi42NDg2OThdICAgICAgICBhbWRncHVfZGV2aWNlX2lwX3N1c3BlbmRfcGhhc2Ux
KzB4ODMvMHhlMCBbYW1kZ3B1XQpbICAxMzIuNjQ5NDk4XSAgICAgICAgYW1kZ3B1X2RldmljZV9p
cF9zdXNwZW5kKzB4MWMvMHg2MCBbYW1kZ3B1XQpbICAxMzIuNjUwMzAwXSAgICAgICAgYW1kZ3B1
X2RldmljZV9ncHVfcmVjb3Zlci5jb2xkKzB4NGU2LzB4ZTY0IFthbWRncHVdClsgIDEzMi42NTEw
ODRdICAgICAgICBhbWRncHVfam9iX3RpbWVkb3V0KzB4ZmIvMHgxNTAgW2FtZGdwdV0KWyAgMTMy
LjY1MTgyNV0gICAgICAgIGRybV9zY2hlZF9qb2JfdGltZWRvdXQrMHg4YS8weGYwIFtncHVfc2No
ZWRdClsgIDEzMi42NTI1OTRdICAgICAgICBwcm9jZXNzX29uZV93b3JrKzB4MjNjLzB4NTgwClsg
IDEzMi42NTM0MDJdICAgICAgICB3b3JrZXJfdGhyZWFkKzB4NTAvMHgzYjAKWyAgMTMyLjY1NDEz
OV0gICAgICAgIGt0aHJlYWQrMHgxMmUvMHgxNTAKWyAgMTMyLjY1NDg2OF0gICAgICAgIHJldF9m
cm9tX2ZvcmsrMHgyNy8weDUwClsgIDEzMi42NTU1OThdCiAgICAgICAgICAgICAgIG90aGVyIGlu
Zm8gdGhhdCBtaWdodCBoZWxwIHVzIGRlYnVnIHRoaXM6CgpbICAxMzIuNjU3NzM5XSBDaGFpbiBl
eGlzdHMgb2Y6CiAgICAgICAgICAgICAgICAgY3J0Y193d19jbGFzc19hY3F1aXJlIC0tPiBjcnRj
X3d3X2NsYXNzX211dGV4IC0tPiBkbWFfZmVuY2VfbWFwCgpbICAxMzIuNjU5ODc3XSAgUG9zc2li
bGUgdW5zYWZlIGxvY2tpbmcgc2NlbmFyaW86CgpbICAxMzIuNjYxNDE2XSAgICAgICAgQ1BVMCAg
ICAgICAgICAgICAgICAgICAgQ1BVMQpbICAxMzIuNjYyMTI2XSAgICAgICAgLS0tLSAgICAgICAg
ICAgICAgICAgICAgLS0tLQpbICAxMzIuNjYyODQ3XSAgIGxvY2soZG1hX2ZlbmNlX21hcCk7Clsg
IDEzMi42NjM1NzRdICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb2NrKGNydGNfd3df
Y2xhc3NfbXV0ZXgpOwpbICAxMzIuNjY0MzE5XSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbG9jayhkbWFfZmVuY2VfbWFwKTsKWyAgMTMyLjY2NTA2M10gICBsb2NrKGNydGNfd3dfY2xh
c3NfYWNxdWlyZSk7ClsgIDEzMi42NjU3OTldCiAgICAgICAgICAgICAgICAqKiogREVBRExPQ0sg
KioqCgpbICAxMzIuNjY3OTY1XSA0IGxvY2tzIGhlbGQgYnkga3dvcmtlci8yOjMvODY1OgpbICAx
MzIuNjY4NzAxXSAgIzA6IGZmZmY4ODg3ZmI4MWM5MzggKCh3cV9jb21wbGV0aW9uKWV2ZW50cyl7
Ky4rLn0tezA6MH0sIGF0OiBwcm9jZXNzX29uZV93b3JrKzB4MWJjLzB4NTgwClsgIDEzMi42Njk0
NjJdICAjMTogZmZmZmM5MDAwMDY3N2U1OCAoKHdvcmtfY29tcGxldGlvbikoJigmc2NoZWQtPndv
cmtfdGRyKS0+d29yaykpeysuKy59LXswOjB9LCBhdDogcHJvY2Vzc19vbmVfd29yaysweDFiYy8w
eDU4MApbICAxMzIuNjcwMjQyXSAgIzI6IGZmZmZmZmZmODIzMThjODAgKGRtYV9mZW5jZV9tYXAp
eysrKyt9LXswOjB9LCBhdDogZHJtX3NjaGVkX2pvYl90aW1lZG91dCsweDI1LzB4ZjAgW2dwdV9z
Y2hlZF0KWyAgMTMyLjY3MTAzOV0gICMzOiBmZmZmODg4N2I4NGExNzQ4ICgmYWRldi0+bG9ja19y
ZXNldCl7Ky4rLn0tezM6M30sIGF0OiBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVyLmNvbGQrMHg1
OWUvMHhlNjQgW2FtZGdwdV0KWyAgMTMyLjY3MTkwMl0KICAgICAgICAgICAgICAgc3RhY2sgYmFj
a3RyYWNlOgpbICAxMzIuNjczNTE1XSBDUFU6IDIgUElEOiA4NjUgQ29tbToga3dvcmtlci8yOjMg
VGFpbnRlZDogRyAgICAgICAgVyAgICAgICAgIDUuNy4wLXJjMysgIzM0NgpbICAxMzIuNjc0MzQ3
XSBIYXJkd2FyZSBuYW1lOiBTeXN0ZW0gbWFudWZhY3R1cmVyIFN5c3RlbSBQcm9kdWN0IE5hbWUv
UFJJTUUgWDM3MC1QUk8sIEJJT1MgNDAxMSAwNC8xOS8yMDE4ClsgIDEzMi42NzUxOTRdIFdvcmtx
dWV1ZTogZXZlbnRzIGRybV9zY2hlZF9qb2JfdGltZWRvdXQgW2dwdV9zY2hlZF0KWyAgMTMyLjY3
NjA0Nl0gQ2FsbCBUcmFjZToKWyAgMTMyLjY3Njg5N10gIGR1bXBfc3RhY2srMHg4Zi8weGQwClsg
IDEzMi42Nzc3NDhdICBjaGVja19ub25jaXJjdWxhcisweDE2Mi8weDE4MApbICAxMzIuNjc4NjA0
XSAgPyBzdGFja190cmFjZV9zYXZlKzB4NGIvMHg3MApbICAxMzIuNjc5NDU5XSAgX19sb2NrX2Fj
cXVpcmUrMHgxMjQxLzB4MjNmMApbICAxMzIuNjgwMzExXSAgbG9ja19hY3F1aXJlKzB4YWQvMHgz
NzAKWyAgMTMyLjY4MTE2M10gID8gZHJtX2F0b21pY19oZWxwZXJfc3VzcGVuZCsweDM4LzB4MTIw
IFtkcm1fa21zX2hlbHBlcl0KWyAgMTMyLjY4MjAyMV0gID8gY3B1bWFza19uZXh0KzB4MTYvMHgy
MApbICAxMzIuNjgyODgwXSAgPyBtb2R1bGVfYXNzZXJ0X211dGV4X29yX3ByZWVtcHQrMHgxNC8w
eDQwClsgIDEzMi42ODM3MzddICA/IF9fbW9kdWxlX2FkZHJlc3MrMHgyOC8weGYwClsgIDEzMi42
ODQ2MDFdICBkcm1fbW9kZXNldF9hY3F1aXJlX2luaXQrMHhkMi8weDEwMCBbZHJtXQpbICAxMzIu
Njg1NDY2XSAgPyBkcm1fYXRvbWljX2hlbHBlcl9zdXNwZW5kKzB4MzgvMHgxMjAgW2RybV9rbXNf
aGVscGVyXQpbICAxMzIuNjg2MzM1XSAgZHJtX2F0b21pY19oZWxwZXJfc3VzcGVuZCsweDM4LzB4
MTIwIFtkcm1fa21zX2hlbHBlcl0KWyAgMTMyLjY4NzI1NV0gIGRtX3N1c3BlbmQrMHgxYy8weDYw
IFthbWRncHVdClsgIDEzMi42ODgxNTJdICBhbWRncHVfZGV2aWNlX2lwX3N1c3BlbmRfcGhhc2Ux
KzB4ODMvMHhlMCBbYW1kZ3B1XQpbICAxMzIuNjg5MDU3XSAgPyBhbWRncHVfZmVuY2VfcHJvY2Vz
cysweDRjLzB4MTUwIFthbWRncHVdClsgIDEzMi42ODk5NjNdICBhbWRncHVfZGV2aWNlX2lwX3N1
c3BlbmQrMHgxYy8weDYwIFthbWRncHVdClsgIDEzMi42OTA4OTNdICBhbWRncHVfZGV2aWNlX2dw
dV9yZWNvdmVyLmNvbGQrMHg0ZTYvMHhlNjQgW2FtZGdwdV0KWyAgMTMyLjY5MTgxOF0gIGFtZGdw
dV9qb2JfdGltZWRvdXQrMHhmYi8weDE1MCBbYW1kZ3B1XQpbICAxMzIuNjkyNzA3XSAgZHJtX3Nj
aGVkX2pvYl90aW1lZG91dCsweDhhLzB4ZjAgW2dwdV9zY2hlZF0KWyAgMTMyLjY5MzU5N10gIHBy
b2Nlc3Nfb25lX3dvcmsrMHgyM2MvMHg1ODAKWyAgMTMyLjY5NDQ4N10gIHdvcmtlcl90aHJlYWQr
MHg1MC8weDNiMApbICAxMzIuNjk1MzczXSAgPyBwcm9jZXNzX29uZV93b3JrKzB4NTgwLzB4NTgw
ClsgIDEzMi42OTYyNjRdICBrdGhyZWFkKzB4MTJlLzB4MTUwClsgIDEzMi42OTcxNTRdICA/IGt0
aHJlYWRfY3JlYXRlX3dvcmtlcl9vbl9jcHUrMHg3MC8weDcwClsgIDEzMi42OTgwNTddICByZXRf
ZnJvbV9mb3JrKzB4MjcvMHg1MAoKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzog
bGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCkNjOiBsaW51eC1yZG1hQHZnZXIua2VybmVs
Lm9yZwpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGludGVsLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNv
LnVrPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVs
LmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgOCArKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCA0YzQ0OTJkZTY3MGMuLjNlYTRiOTI1OGZiMCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMjQ0MSw2ICsy
NDQxLDE0IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9pcF9zdXNwZW5kX3BoYXNlMShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJLyogZGlzcGxheXMgYXJlIGhhbmRsZWQgc2VwYXJh
dGVseSAqLwogCQlpZiAoYWRldi0+aXBfYmxvY2tzW2ldLnZlcnNpb24tPnR5cGUgPT0gQU1EX0lQ
X0JMT0NLX1RZUEVfRENFKSB7CiAJCQkvKiBYWFggaGFuZGxlIGVycm9ycyAqLworCisJCQkvKgor
CQkJICogVGhpcyBpcyBkbV9zdXNwZW5kLCB3aGljaCBjYWxscyBtb2Rlc2V0IGxvY2tzLCBhbmQK
KwkJCSAqIHRoYXQgYSBwcmV0dHkgZ29vZCBpbnZlcnNpb24gYWdhaW5zdCBkbWFfZmVuY2Vfc2ln
bmFsCisJCQkgKiB3aGljaCBncHUgcmVjb3ZlcnkgaXMgc3VwcG9zZWQgdG8gZ3VhcmFudGVlLgor
CQkJICoKKwkJCSAqIERvbnQgYXNrIG1lIGhvdyB0byBmaXggdGhpcy4KKwkJCSAqLwogCQkJciA9
IGFkZXYtPmlwX2Jsb2Nrc1tpXS52ZXJzaW9uLT5mdW5jcy0+c3VzcGVuZChhZGV2KTsKIAkJCS8q
IFhYWCBoYW5kbGUgZXJyb3JzICovCiAJCQlpZiAocikgewotLSAKMi4yNi4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
