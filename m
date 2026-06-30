Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +N3EF429RGrRzwoAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 09:11:09 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA976EA825
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 09:11:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=H9AtX5gv;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334C210EDFD;
	Wed,  1 Jul 2026 07:11:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0188510ED40
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jun 2026 20:28:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1782851306; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QeshbaSU6hizs4JI6RTD0I+xIOKSfJ+BzzRbbaXOoh36dtqA83XU7zY63DiOtPtDdK9EnAvyCNOP+Mym34E5UeWNCMCfx/GdBba3hiaTAEHYtdauiMifofYhkcigp8T43O09N/pTTw2Bmw5ta/SJM3vLTZaXCd5urxuZtjCqHns=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1782851306;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=/xxStwIF61bn3ZqA6+M8xNVE8MJdolxYpTE31ogRu80=; 
 b=Q27/1FCC1Yecxiu8Ycjcn0we7lyb1KuRCzPLUau1a3PyQs6CcGSZXJADxY6krCcnoG1CRL7eJOcDPp4ifDyzcwfe8D0uBpXxmvbj+vEs+jiZGcdwZLjYM4zXWBpUwZQkPK1yxrHpAKTiX5GGDZfjnoDDBZzdcbrXIbbdArIO4ak=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782851306; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
 bh=/xxStwIF61bn3ZqA6+M8xNVE8MJdolxYpTE31ogRu80=;
 b=H9AtX5gvsE/h6k/VgvBl0++qclp1i6kMqdsXkXgoGl5+fDL+UbnmnDKjaNYFMXLS
 9HIOrsYzBf3wvVkz40VodOmY9lssOPVb4CrMSVy0Qt3uLhsZgxikHjKKBGPWVcJrMVA
 IAMCVLa/d57+NSZzSDegNvdvrW8OYekyPozQOg18=
Received: by mx.zohomail.com with SMTPS id 178285130449927.213119788359222;
 Tue, 30 Jun 2026 13:28:24 -0700 (PDT)
Message-ID: <102a923307828ec347c99fc982cf2665097218c9.camel@collabora.com>
Subject: Reminder: Call for Proposals closing soon for XDC 2026!
From: Mark Filion <mark.filion@collabora.com>
To: amd-gfx@lists.freedesktop.org
Date: Tue, 30 Jun 2026 16:28:23 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Approved-At: Wed, 01 Jul 2026 07:11:03 +0000
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
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	SUBJECT_ENDS_EXCLAIM(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	FROM_NEQ_ENVFROM(0.00)[mark.filion@collabora.com,amd-gfx-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,freedesktop.org:url];
	ALIAS_RESOLVED(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BDA976EA825

Hello!

Reminder - The deadline for submissions for XDC 2026 is this coming
Friday, 3 July 2026.

    https://xdc2026.x.org

While any serious proposal will be gratefully considered, topics of
interest to X.Org and freedesktop.org developers are encouraged. The
program focus is on new development, ongoing challenges and anything
else that will spark discussions among attendees in the hallway track.

We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more!
 =20
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible!

Best,

Mark
