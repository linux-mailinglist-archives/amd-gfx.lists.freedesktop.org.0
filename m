Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 598EE21EE75
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2020 12:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394F56E0DE;
	Tue, 14 Jul 2020 10:57:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A511E6E0DE
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 10:57:20 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06EAuxOa077273;
 Tue, 14 Jul 2020 10:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=vBU2QIH4dLhpISZDy3iGJ2QdEzBeF97nSpmac36o04w=;
 b=soSy8qQF+N75EAKupN+A8EXKXSU/IJMMAWVz+u1RJthPQfakoSWp6nour2GJ0QJGYs2P
 FfucdEm5nj5Rq6CozvcjiZWFeOGFfoHxa/crmwoDLxxWVQOtoRJ1tkodr2ilsIwn8iAx
 90YBrF8nk1oJeOFbcgGIFNVhM2tlv0oH+so1VHEcqIs+pZRePQz/lwIjyQdZrVS4B9Ss
 QGQd9gnQ6D4R1c0c6MXu9RDdW51DC26K0oXyDmlnR5RMTINqczE5hwgIVkl5DS8WZ+Td
 wvDSAy1o8vivaaNy4QyHAuKeTOhBphXe+WSXjfUyml+1KdT9rgnVHhbEGXqDpUmcwAuq 3g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 32762nchrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 Jul 2020 10:57:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06EAqfdq022571;
 Tue, 14 Jul 2020 10:57:16 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 327qbxdhfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jul 2020 10:57:16 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06EAvAXU016894;
 Tue, 14 Jul 2020 10:57:10 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 14 Jul 2020 03:57:09 -0700
Date: Tue, 14 Jul 2020 13:57:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH] drm/amd/display: remove an unnecessary NULL check
Message-ID: <20200714105700.GC294318@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007140083
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 spamscore=0
 clxscore=1011 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007140084
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
Cc: kernel-janitors@vger.kernel.org,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Yongqiang Sun <yongqiang.sun@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Martin Leung <martin.leung@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The "stream" pointer can't be NULL and it's dereferenced on the line
before so the check doesn't make sense.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 4f97329d9daf..7e58f242dab9 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2324,7 +2324,7 @@ static void commit_planes_for_stream(struct dc *dc,
 
 	if ((update_type != UPDATE_TYPE_FAST) && stream->update_flags.bits.dsc_changed)
 		if (top_pipe_to_program->stream_res.tg->funcs->lock_doublebuffer_enable) {
-			if (stream && should_use_dmub_lock(stream->link)) {
+			if (should_use_dmub_lock(stream->link)) {
 				union dmub_hw_lock_flags hw_locks = { 0 };
 				struct dmub_hw_lock_inst_flags inst_flags = { 0 };
 
-- 
2.27.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
