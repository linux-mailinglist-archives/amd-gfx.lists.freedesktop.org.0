Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D3EC9C47
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 12:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B9F88A28;
	Thu,  3 Oct 2019 10:31:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062C088A28;
 Thu,  3 Oct 2019 10:31:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 03:31:21 -0700
X-IronPort-AV: E=Sophos;i="5.67,251,1566889200"; d="scan'208";a="196304954"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 03:31:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 00/14] DSC MST support for AMDGPU
In-Reply-To: <20191001161721.13793-1-mikita.lipski@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191001161721.13793-1-mikita.lipski@amd.com>
Date: Thu, 03 Oct 2019 13:31:15 +0300
Message-ID: <87bluy9l3g.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCAwMSBPY3QgMjAxOSwgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4gd3JvdGU6Cj4gVGhp
cyBzZXQgb2YgcGF0Y2hlcyBpcyBhIGNvbnRpbnVhdGlvbiBvZiBEU0MgZW5hYmxlbWVudAo+IHBh
dGNoZXMgZm9yIEFNREdQVS4gVGhpcyBzZXQgZW5hYmxlcyBEU0Mgb24gTVNULiBJdCBhbHNvCj4g
Y29udGFpbnMgaW1wbGVtZW50YXRpb24gb2YgYm90aCBlbmNvZGVyIGFuZCBjb25uZWN0b3IKPiBh
dG9taWMgY2hlY2sgcm91dGluZXMuCgpQbGVhc2UgY29uc2lkZXIgKm5vdCogdXNpbmcgZ2l0IHNl
bmQtZW1haWwgLS1jaGFpbi1yZXBseS10byBvcHRpb24gKG9yCnNlbmRlbWFpbC5jaGFpblJlcGx5
VG8gY29uZmlndXJhdGlvbikuIE9yLCBpZiBpdCBjb21lcyBmcm9tIGdpdApmb3JtYXQtcGF0Y2gs
IC0tdGhyZWFkPWRlZXAgLyBmb3JtYXQudGhyZWFkPWRlZXAuCgpCUiwKSmFuaS4KCi0tIApKYW5p
IE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
